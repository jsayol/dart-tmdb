// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Companies' API calls
class Companies {
  final TMDBApiCore _core;

  Companies(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.companies.get();
  get() {
    return _core;
  }
}
