// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Networks' API calls
class Networks {
  final TMDBApiCore _core;

  Networks(this._core);

  /// This method is used to retrieve the basic information about a TV network.
  ///
  /// You can use this ID to search for TV shows with the discover. At this time we don't have much but this will be fleshed out over time.
  ///
  ///     // Usage
  ///     Map result = await tmdb.networks.getInfo('16');
  Future<Map> getInfo(String id) {
    _checkNotNull(id, 'id');
    return _core._query('network/$id');
  }
}
