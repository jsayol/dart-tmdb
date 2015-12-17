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
    Params params = new Params();
    params.add('language', language);
    return _core._query('genre/movie/list', params: params);
  }

  /// Get the list of TV genres.
  ///
  ///     // Usage
  ///     Map result = await tmdb.genres.forTv();
  Future<Map> forTv({String language}) {
    Params params = new Params();
    params.add('language', language);
    return _core._query('genre/tv/list', params: params);
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
    Params params = new Params();
    _checkNotNull(id, 'id');
    params.add('page', page);
    params.add('language', language);
    params.add('include_all_movies', includeAll);
    params.add('include_adult', includeAdult);
    return _core._query('genre/$id/movies', params: params);
  }
}
