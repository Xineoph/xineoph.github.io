import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_test/data/repository/repository.dart';
import 'package:nasa_test/data/models/response_model.dart';
import 'package:nasa_test/presentation/main_page/cubit/main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  final DataRepository repository;
  MainPageCubit(
    this.repository,
  ) : super(const MainPageState());

  void init() async {
    ResponseModel? nasaImageDataModel = await repository.getData();
    if (nasaImageDataModel != null) {
      emit(
        state.update(
          nasaImageDataModel: nasaImageDataModel,
          isLoading: false,
        ),
      );
    } else {
      emit(
        state.update(
          isErrorMode: true,
          isLoading: false,
        ),
      );
    }
  }
}
