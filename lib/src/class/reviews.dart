// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Reviews' API calls
class _Reviews {
  final TmdbApiCore _core;

  _Reviews(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.reviews.get();
  get() {
    return _core;
  }
}
