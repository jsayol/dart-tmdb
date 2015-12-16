// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Credits' API calls
class Credits {
  final TMDBApiCore _core;

  Credits(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.credits.get();
  get() {
    return _core;
  }
}
