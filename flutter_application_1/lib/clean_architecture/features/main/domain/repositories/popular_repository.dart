import 'package:flutter_application_1/clean_architecture/core/resources/data_state.dart';
import 'package:flutter_application_1/clean_architecture/features/main/domain/entities/popular_entity.dart';

abstract class PopularMovieRepository {
  Future<DataState<List<PopularEntity>>> getPopularMovies();
}