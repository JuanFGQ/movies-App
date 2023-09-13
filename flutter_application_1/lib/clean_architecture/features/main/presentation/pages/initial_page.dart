import 'package:flutter/material.dart';
import 'package:flutter_application_1/clean_architecture/features/main/presentation/bloc/bloc/movies_bloc.dart';
import 'package:flutter_application_1/clean_architecture/features/main/presentation/bloc/bloc/movies_state.dart';
import 'package:flutter_application_1/clean_architecture/features/main/presentation/widgets/widgets_butterfile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteMoviesBloc, RemoteMoviesState>(
        builder: (_, state) {
      if (state is RemoteMoviesLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is RemoteMoviesError) {
        return const Center(child: Icon(Icons.refresh));
      }
      if (state is RemoteMoviesDone) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies: state.movies),
              // MovieSlider(
              //   movies: null,
              // )
            ],
          ),
        );
      }
      return const SizedBox();
    });
  }
}