// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Credits' API calls
class Credits {
  final TMDBApiCore _core;

  Credits(this._core);

  /// Get the detailed information about a particular credit record.
  ///
  /// This is currently only supported with the new credit model found in TV. These ids can be found from any TV credit response as well as the `getTvCredits()` and `getCombinedCredits()` methods for people.
  /// The episodes object returns a list of episodes and are generally going to be guest stars. The season array will return a list of season numbers. Season credits are credits that were marked with the "add to every season" option in the editing interface and are assumed to be "season regulars".
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.credits.getInfo('105');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.credits.getInfo('105', language: 'es');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map result = await tmdb.credits.getInfo('105', append: ['trailers', 'reviews']);
  Future<Map> getInfo(String id, {String language}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'language', value: language);
    return _core.doQuery('credit/$id', params: params);
  }
}
