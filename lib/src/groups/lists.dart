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
  ///     Map result = await tmdb.lists.getInfo('567415c89251412db4002432');
  Future<Map> getInfo(String id) {
    _checkNotNull(id, 'id');
    return _core._query('list/$id');
  }

  /// Delete a list by id.
  ///
  /// A valid session id is required.
  ///
  ///     // Usage
  ///     Map result = await tmdb.lists.deleteById('567415c89251412db4002432');
  Future<Map> deleteById(id) {
    _Params params = new _Params.withSession();
    _checkNotNull(id, 'id');
    return _core._query('list/$id', params: params, method: 'DELETE');
  }

  /// Check to see if a movie ID is already added to a list.
  ///
  ///     // Usage
  ///     Map result = await tmdb.lists.checkStatus('567415c89251412db4002432');
  Future<Map> checkStatus(String listId, String movieId) {
    _Params params = new _Params();
    _checkNotNull(listId, 'listId');
    _checkNotNull(movieId, 'movieId');
    params['movie_id'] = movieId;
    return _core._query('list/$listId/item_status');
  }

  /// This method lets users create a new list.
  ///
  /// A valid session id is required.
  ///
  ///     // Usage
  ///     Map result = await tmdb.lists.create('Time travel', 'My awesome list of movies about time travel');
  Future<Map> create(String name, String description, {String language}) {
    _Params params = new _Params.withSession();
    _checkNotNull(name, 'name');
    _checkNotNull(description, 'description');
    params['name'] = name;
    params['description'] = description;
    params['language'] = language;
    return _core._query('list', params: params, method: 'POST');
  }

  /// This method lets users add new movies to a list that they created.
  ///
  /// A valid session id is required.
  ///
  ///     // Usage
  ///     Map result = await tmdb.lists.addItem('567415c89251412db4002432', '105');
  Future<Map> addItem(String listId, String mediaId) {
    _Params params = new _Params.withSession();
    _checkNotNull(listId, 'listId');
    _checkNotNull(mediaId, 'mediaId');
    params['media_id'] = mediaId;
    return _core._query('list/$listId/add_item', params: params, method: 'POST');
  }

  /// This method lets users delete movies from a list that they created.
  ///
  /// A valid session id is required.
  ///
  ///     // Usage
  ///     Map result = await tmdb.lists.removeItem('567415c89251412db4002432', '105');
  Future<Map> removeItem(String listId, String mediaId) {
    _Params params = new _Params.withSession();
    _checkNotNull(listId, 'listId');
    _checkNotNull(mediaId, 'mediaId');
    params['media_id'] = mediaId;
    return _core._query('list/$listId/remove_item', params: params, method: 'POST');
  }

  /// Clear all of the items within a list.
  ///
  /// This is a irreversible action and should be treated with caution.
  /// A valid session id is required.
  /// A call without confirm=true will return status code 29.
  ///
  ///     // Usage
  ///     Map result = await tmdb.lists.removeItem('567415c89251412db4002432', '105');
  Future<Map> clear(String id, bool confirm) {
    _Params params = new _Params.withSession();
    _checkNotNull(id, 'id');
    _checkNotNull(confirm, 'confirm');
    params['confirm'] = confirm;
    return _core._query('list/$id/clear', params: params, method: 'POST');
  }
}
