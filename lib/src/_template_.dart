// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the '_CLASSNAME_' API calls
class __CLASSNAME_ {
  final TmdbApiCore _core;

  __CLASSNAME_(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi._CLASSNAMELC_.get();
  get() {
    return _core;
  }
}
