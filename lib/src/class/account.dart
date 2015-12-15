// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Account' API calls
class _Account {
  final TmdbApiCore _core;

  _Account(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.account.get();
  get() {
    return _core;
  }
}
