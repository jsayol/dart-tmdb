// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Authentication' API calls
class Authentication {
  final TMDBApiCore _core;

  Authentication(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.authentication.get();
  get() {
    return _core;
  }
}
