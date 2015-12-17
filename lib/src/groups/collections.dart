// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Collections' API calls
class Collections {
  final TMDBApiCore _core;

  Collections(this._core);

  /// Get the basic collection information for a specific collection id.
  ///
  /// You can get the ID needed for this method by making a `tmdb.movies.getInfo(ID)` request and paying attention to the `belongs_to_collection` hash.
  /// Movie parts are not sorted in any particular order. If you would like to sort them yourself you can use the provided `release_date`.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.collections.getInfo('264');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.collections.getInfo('264', language: 'es');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map result = await tmdb.collections.getInfo('264', append: ['trailers', 'reviews']);
  Future<Map> getInfo(String id, {String language, List<String> append}) {
    Params params = new Params();
    _checkNotNull(id, 'id');
    params.add('language', language);
    params.add('append_to_response', append);
    return _core._query('collection/$id', params: params);
  }

  /// Get all of the images for a particular collection by collection id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.collections.getImages('264');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.collections.getImages('264', language: 'es');
  ///
  ///     // Get results in the default language plus in Russian and German.
  ///     // Maximum 5 extra languages per request
  ///     Map result = await tmdb.collections.getImages('264', includeLanguage: ['ru', 'de']);
  ///
  ///     // Get results plus trailers and reviews
  ///     Map result = await tmdb.collections.getInfo('264', append: ['trailers', 'reviews']);
  Future<Map> getImages(String id,
      {String language, List<String> append, List<String> includeLanguage}) {
    Params params = new Params();
    _checkNotNull(id, 'id');
    params.add('language', language);
    params.add('append_to_response', append);
    params.add('include_image_language', includeLanguage);
    return _core._query('collection/$id/images', params: params);
  }
}
