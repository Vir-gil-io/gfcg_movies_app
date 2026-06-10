import 'package:gfcg_movies_app/config/config.dart';
import 'package:gfcg_movies_app/domain/domain.dart';
import 'package:dio/dio.dart';

import '../mappers/movie_mapper.dart';
import '../models/moviedb/moviedb_response.dart';

class MoviedbDatasourceImpl extends MoviesDatasource {
  
  final dio = Dio(BaseOptions(
    baseUrl: Enviroment.apiUrl,
    queryParameters: {
      'api_key': Enviroment.theMovieDbKey,
      'language': Enviroment.language,
    }
  ));

  @override
  Future<Movie> getMovieById(String id) {
    // TODO: implement getMovieById
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing',
    queryParameters: {
      'page': page,
    });

    final movieDbReponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDbReponse.results.map((movieDb) => MovieMapper.movieDbToEntity(movieDb)).toList();
    return movies;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    // TODO: implement getPopular
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getSimilarMovie(String movieId) {
    // TODO: implement getSimilarMovie
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    // TODO: implement getTopRated
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    // TODO: implement getUpcoming
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getYoutubeVideoById(String movieId) {
    // TODO: implement getYoutubeVideoById
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> searchMovie(String query) {
    // TODO: implement searchMovie
    throw UnimplementedError();
  }

}