// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Certifications' API calls
class _Certifications {
  final TmdbApiCore _core;

  _Certifications(this._core);

  /// Retrieves xxxx
  ///
  ///     Map result = tmdbApi.certifications.get();
  get() {
    return _core;
  }
}
