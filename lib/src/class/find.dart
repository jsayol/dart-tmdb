// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Find' API calls
class _Find {
  final TmdbApiCore _core;

  _Find(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.find.get();
  get() {
    return _core;
  }
}
