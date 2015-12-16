// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Collections' API calls
class Collections {
  final TMDBApiCore _core;

  Collections(this._core);

  /// Get the basic movie information for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getById('105');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.movies.getById('105', language: 'es');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map result = await tmdb.movies.getById('105', append: ['trailers', 'reviews']);
  Future<Map> getInfo(String id, {String language, List<String> append}) {
    Map params = {};
    _addParam(params, 'language', value: language);
    _addParam(params, 'append_to_response', list: append);
    return _core.doQuery('movie/$id', params: params);
  }
}
