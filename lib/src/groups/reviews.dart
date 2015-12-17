// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Reviews' API calls
class Reviews {
  final TMDBApiCore _core;

  Reviews(this._core);

  /// Get the full details of a review by ID.
  ///
  ///     // Usage
  ///     Map result = await tmdb.reviews.getInfo('521');
  Future<Map> getInfo(String id) {
    _checkNotNull(id, 'id');
    return _core._query('review/$id');
  }
}
