// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Tv' API calls
class Tv {
  final TMDBApiCore _core;

  Tv(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.tv.get();
  get() {
    return _core;
  }
}
