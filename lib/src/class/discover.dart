// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Discover' API calls
class _Discover {
  final TmdbApiCore _core;

  _Discover(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.discover.get();
  get() {
    return _core;
  }
}
