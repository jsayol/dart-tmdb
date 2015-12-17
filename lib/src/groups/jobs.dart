// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Jobs' API calls
class Jobs {
  final TMDBApiCore _core;

  Jobs(this._core);

  /// Get a list of valid jobs.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.jobs.getList();
  Future<Map> getList() {
    return _core.doQuery('job/list');
  }
}
