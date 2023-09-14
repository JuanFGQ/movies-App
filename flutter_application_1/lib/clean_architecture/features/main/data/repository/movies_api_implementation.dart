import 'package:flutter_application_1/clean_architecture/core/resources/data_state.dart';
import 'package:flutter_application_1/clean_architecture/features/main/data/data_sources/remote/movie_api_service.dart';
import 'package:flutter_application_1/clean_architecture/features/main/data/models/credits_model.dart';
import 'package:flutter_application_1/clean_architecture/features/main/data/models/movie_model.dart';
import 'package:flutter_application_1/clean_architecture/features/main/data/models/popular_model.dart';
import 'package:flutter_application_1/clean_architecture/features/main/data/models/search_model.dart';
import 'package:flutter_application_1/clean_architecture/features/main/domain/entities/credits_entity.dart';
import 'package:flutter_application_1/clean_architecture/features/main/domain/entities/popular_entity.dart';
import 'package:flutter_application_1/clean_architecture/features/main/domain/entities/search_entity.dart';

import '../../domain/repositories/movie_repository.dart';

class MoviesRepositoryImpl implements MovieRepository {
  final MoviesApiService _movieApiService;

  MoviesRepositoryImpl(this._movieApiService);

  @override
  Future<DataState<List<MovieModel>>> getMovieArticles() async {
    final response = await _movieApiService.getMovies();

    final movies = (response.data['results'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList();

    if (response.statusCode == 200) {
      return DataSuccess(movies);
    } else {
      return DataFailed(Exception('failed request status'));
    }
  }

  @override
  Future<DataState<List<CastEntity>>> getMovieCredits(int id) async {
    final response = await _movieApiService.getMovieCastById(id);
    final credits = (response.data['results'] as List)
        .map((data) => CastModel.fromJson(data))
        .toList();

    if (response.statusCode == 200) {
      return DataSuccess(credits);
    } else {
      return DataFailed(Exception('Failed request'));
    }
//
  }

  @override
  Future<DataState<List<PopularEntity>>> getPopularMovies() async {
    final response = await _movieApiService.getPopularMovies();
    final popular = (response.data['results'] as List)
        .map((data) => PopularMoviesModel.fromJson(data))
        .toList();

    if (response.statusCode == 200) {
      return DataSuccess(popular);
    } else {
      return DataFailed(Exception('Failed request'));
    }
  }

  @override
  Future<DataState<List<SearchEntity>>> getSearch(String searc) async {
    final response = await _movieApiService.getSearchMovie(searc);

    final search = (response.data['results'] as List)
        .map((e) => SearchMovieModel.fromJson(e))
        .toList();

    if (response.statusCode == 200) {
      return DataSuccess(search);
    } else {
      return DataFailed(Exception('Failed request'));
    }
  }
}

// class PopularMoviesRepositoryImpl implements PopularMovieRepository {
//   final MoviesApiService _moviesApiService;

//   PopularMoviesRepositoryImpl(this._moviesApiService);

//   @override
//   Future<DataState<List<PopularMoviesModel>>> getPopularMovies() async {
//     final response = await _moviesApiService.getPopularMovies();
//     final popular = (response.data['results'] as List)
//         .map((data) => PopularMoviesModel.fromJson(data))
//         .toList();

//     if (response.statusCode == 200) {
//       return DataSuccess(popular);
//     } else {
//       return DataFailed(Exception('Failed request'));
//     }
//   }
// }

// class MovieCastRepositoryImp implements CastRepository {
//   final MoviesApiService _moviesApiService;

//   MovieCastRepositoryImp(this._moviesApiService);

//   @override
//   Future<DataState<List<CastEntity>>> getMovieCredits() async {
//     final response = await _moviesApiService.getMovieCastById(1);
//     final credits = (response.data['results'] as List)
//         .map((data) => CastModel.fromJson(data))
//         .toList();

//     if (response.statusCode == 200) {
//       return DataSuccess(credits);
//     } else {
//       return DataFailed(Exception('Failed request'));
//     }
//   }
// }

// class SearchMovieRepositoryImpl implements SearchRepository {
//   final MoviesApiService _moviesApiService;

//   SearchMovieRepositoryImpl(this._moviesApiService);

//   @override
//   Future<DataState<List<SearchEntity>>> getSearch() async {
//     final response = await _moviesApiService.getSearchMovie('nemo');

//     final search = (response.data['results'] as List)
//         .map((e) => SearchMovieModel.fromJson(e))
//         .toList();

//     if (response.statusCode == 200) {
//       return DataSuccess(search);
//     } else {
//       return DataFailed(Exception('Failed request'));
//     }
//   }
// }
