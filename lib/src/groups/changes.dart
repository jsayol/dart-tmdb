// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Changes' API calls
class Changes {
  final TMDBApiCore _core;

  Changes(this._core);

  /// Get a list of movie ids that have been edited.
  ///
  /// By default we show the last 24 hours and only 100 items per page. The maximum number of days that can be returned in a single request is 14. You can then use the movie changes API to get the actual data that has been changed.
  /// Please note: the change log system to support this was changed on October 5, 2012 and will only show movies that have been edited since.
  ///
  ///     // Usage
  ///     Map result = await tmdb.changes.getMovies();
  Future<Map> getMovies() {
    return _core.doQuery('movie/changes');
  }

    /// Get a list of people ids that have been edited.
    ///
    /// By default we show the last 24 hours and only 100 items per page. The maximum number of days that can be returned in a single request is 14. You can then use the person changes API to get the actual data that has been changed.
    /// Please note: the change log system to support this was changed on October 5, 2012 and will only show people that have been edited since.
    ///
    ///     // Usage
    ///     Map result = await tmdb.changes.getPeople();
    Future<Map> getPeople() {
      return _core.doQuery('person/changes');
    }

  /// Get a list of TV show ids that have been edited.
  ///
  /// By default we show the last 24 hours and only 100 items per page. The maximum number of days that can be returned in a single request is 14. You can then use the TV changes API to get the actual data that has been changed.
  /// Please note: the change log system to properly support TV was updated on May 13, 2014. You'll likely only find the edits made since then to be useful in the change log system.
  ///
  ///     // Usage
  ///     Map result = await tmdb.changes.getTv();
  Future<Map> getTv() {
    return _core.doQuery('tv/changes');
  }
}
