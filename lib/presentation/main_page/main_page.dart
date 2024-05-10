import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nasa_test/presentation/main_page/cubit/main_page_cubit.dart';
import 'package:nasa_test/presentation/main_page/cubit/main_page_state.dart';
import 'package:nasa_test/presentation/full_screen_image_page/full_screen_image_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<MainPageCubit>(),
      child: Scaffold(
        body: BlocBuilder<MainPageCubit, MainPageState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state.isErrorMode) {
              return const Center(
                child: Text('Some error'),
              );
            }
            return Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height, 
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenImagePage(
                              imageUrl: state.nasaImageDataModel!.url,
                              title: state.nasaImageDataModel!.title,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'imageHero',
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          alignment: Alignment.center,
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.5,
                          ),
                          child: Image.network(
                            state.nasaImageDataModel!.url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        state.nasaImageDataModel!.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
