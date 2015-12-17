// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Lists' API calls
class Lists {
  final TMDBApiCore _core;

  Lists(this._core);

  /// Get a list by id.
  ///
  ///     // Usage
  ///     Map result = await tmdb.lists.getInfo('5558aea6c3a3687774008f11');
  Future<Map> getInfo(String id) {
    _checkNotNull(id, 'id');
    return _core._query('list/$id');
  }

  /// Delete a list by id.
  ///
  /// TODO
  Future<Map> deleteById(id) {
    return new Future(() => null);
  }

  /// Check to see if a movie ID is already added to a list.
  ///
  ///     // Usage
  ///     Map result = await tmdb.lists.checkStatus('5558aea6c3a3687774008f11');
  Future<Map> checkStatus(String listId, String movieId) {
    Params params = new Params();
    _checkNotNull(listId, 'listId');
    _checkNotNull(movieId, 'movieId');
    params.add('movie_id', movieId);
    return _core._query('list/$listId/item_status');
  }

  /// This method lets users create a new list. A valid session id is required.
  ///
  /// TODO
  Future<Map> create() {
    return new Future(() => null);
  }

  /// This method lets users add new movies to a list that they created. A valid session id is required.
  ///
  /// TODO
  Future<Map> addItem(id) {
    return new Future(() => null);
  }

  /// This method lets users delete movies from a list that they created. A valid session id is required.
  ///
  /// TODO
  Future<Map> removeItem(id) {
    return new Future(() => null);
  }

  /// Clear all of the items within a list.
  ///
  /// This is a irreversible action and should be treated with caution. A valid session id is required. A call without confirm=true will return status code 29.
  ///
  /// TODO
  Future<Map> clear(id) {
    return new Future(() => null);
  }
}
