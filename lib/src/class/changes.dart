// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Changes' API calls
class _Changes {
  final TmdbApiCore _core;

  _Changes(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.changes.get();
  get() {
    return _core;
  }
}
