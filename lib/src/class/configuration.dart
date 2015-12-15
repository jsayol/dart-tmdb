// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Configuration' API calls
class _Configuration {
  final TmdbApiCore _core;

  _Configuration(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.configuration.get();
  get() {
    return _core;
  }
}
