// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Search' API calls
class Search {
  final TMDBApiCore _core;

  Search(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.search.get();
  get() {
    return _core;
  }
}
