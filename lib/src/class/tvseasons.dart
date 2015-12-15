// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Tvseasons' API calls
class _Tvseasons {
  final TmdbApiCore _core;

  _Tvseasons(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.tvseasons.get();
  get() {
    return _core;
  }
}
