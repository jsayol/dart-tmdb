// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Tvepisodes' API calls
class _Tvepisodes {
  final TmdbApiCore _core;

  _Tvepisodes(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.tvepisodes.get();
  get() {
    return _core;
  }
}
