// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Timezones' API calls
class _Timezones {
  final TmdbApiCore _core;

  _Timezones(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.timezones.get();
  get() {
    return _core;
  }
}
