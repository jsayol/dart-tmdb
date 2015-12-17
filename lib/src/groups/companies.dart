// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Companies' API calls
class Companies {
  final TMDBApiCore _core;

  Companies(this._core);

  /// This method is used to retrieve all of the basic information about a company.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.companies.getInfo('56');
  ///
  ///     // Get results plus company movies
  ///     Map result = await tmdb.companies.getInfo('56', append: ['movies']);
  Future<Map> getInfo(String id, {List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'append_to_response', list: append);
    return _core._query('company/$id', params: params);
  }

  /// Get the list of movies associated with a particular company.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.companies.getMovies('56');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.companies.getMovies('56', language: 'es');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.companies.getMovies('56', page: 2);
  Future<Map> getMovies(String id,
      {int page, String language, List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    _addParam(params, 'append_to_response', list: append);
    return _core._query('company/$id/movies', params: params);
  }
}
