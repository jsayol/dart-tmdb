// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Lists' API calls
class Lists {
  final TMDBApiCore _core;

  Lists(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.lists.get();
  get() {
    return _core;
  }
}
