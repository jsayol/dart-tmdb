// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Timezones' API calls
class Timezones {
  final TMDBApiCore _core;

  Timezones(this._core);

  /// Get the list of supported timezones for the API methods that support them.
  ///
  ///     // Usage
  ///     Map result = await tmdb.timezones.list();
  Future<Map> list() {
    return _core._query('timezones/list');
  }
}
