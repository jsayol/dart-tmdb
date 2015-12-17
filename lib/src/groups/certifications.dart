// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Certifications' API calls
class Certifications {
  final TMDBApiCore _core;

  Certifications(this._core);

  /// Get the list of supported certifications for movies.
  ///
  /// These can be used in conjunction with the certification_country and certification.lte parameters when using discover.
  ///
  ///     // Usage
  ///     Map result = await tmdb.certifications.getMovieList();
  Future<Map> getMovieList() {
    return _core._query('certification/movie/list');
  }

  /// Get the list of supported certifications for tv shows.
  ///
  ///     // Usage
  ///     Map result = await tmdb.certifications.getTvList();
  Future<Map> getTvList() {
    return _core._query('certification/tv/list');
  }
}
