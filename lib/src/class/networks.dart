// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Networks' API calls
class _Networks {
  final TmdbApiCore _core;

  _Networks(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.networks.get();
  get() {
    return _core;
  }
}
