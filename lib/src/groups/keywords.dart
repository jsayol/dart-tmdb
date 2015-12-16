// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Keywords' API calls
class Keywords {
  final TMDBApiCore _core;

  Keywords(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.keywords.get();
  get() {
    return _core;
  }
}
