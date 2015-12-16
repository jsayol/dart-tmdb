// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Genres' API calls
class Genres {
  final TMDBApiCore _core;

  Genres(this._core);

  /// Get the list of movie genres.
  ///
  ///     // Usage
  ///     Map result = await tmdb.genres.forMovies();
  Future<Map> forMovies({String language}) {
    Map params = {};
    _addParam(params, 'language', value: language);
    return _core.doQuery('genre/movie/list', params: params);
  }

  /// Get the list of TV genres.
  ///
  ///     // Usage
  ///     Map result = await tmdb.genres.forTv();
  Future<Map> forTv({String language}) {
    Map params = {};
    _addParam(params, 'language', value: language);
    return _core.doQuery('genre/tv/list', params: params);
  }

  /// Get the list of movies for a particular genre by id.
  ///
  /// By default, only movies with 10 or more votes are included.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.genres.getMovies('878');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.genres.getMovies('878', language: 'es');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.genres.getMovies('878', page: 2);
  Future<Map> getMovies(String id, {int page, String language, bool includeAll, bool includeAdult}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    _addParam(params, 'include_all_movies', value: includeAll);
    _addParam(params, 'include_adult', value: includeAdult);
    return _core.doQuery('genre/$id/movies', params: params);
  }
}
