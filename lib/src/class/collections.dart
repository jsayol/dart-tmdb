// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Collections' API calls
class _Collections {
  final TmdbApiCore _core;

  _Collections(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.collections.get();
  get() {
    return _core;
  }
}
