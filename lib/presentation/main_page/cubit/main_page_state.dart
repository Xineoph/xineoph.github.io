import 'package:equatable/equatable.dart';
import 'package:nasa_test/data/models/response_model.dart';

class MainPageState extends Equatable {
  final bool isLoading;
  final ResponseModel? nasaImageDataModel;
  final bool isErrorMode;

  const MainPageState({
    this.isLoading = true,
    this.nasaImageDataModel,
    this.isErrorMode = false,
  });

  MainPageState update({
    bool? isLoading,
    ResponseModel? nasaImageDataModel,
    bool? isErrorMode,
  }) {
    return MainPageState(
      isLoading: isLoading ?? this.isLoading,
      nasaImageDataModel: nasaImageDataModel ?? this.nasaImageDataModel,
      isErrorMode: isErrorMode ?? this.isErrorMode,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        nasaImageDataModel,
        isErrorMode,
      ];
}
