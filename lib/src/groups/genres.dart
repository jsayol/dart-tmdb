// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Genres' API calls
class Genres {
  final TMDBApiCore _core;

  Genres(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.genres.get();
  get() {
    return _core;
  }
}
