// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the parameters that will be passed to the query.
class Params {
  // final TMDBApiCore _core;
  Map _obj = new Map<String, String>();

  /// Create an object with no parameters.
  Params();

  /// Create an object and add the session ID as a parameter.
  Params.withSessionId(TMDBApiCore core, {bool error: true}) {
    _obj['session_id'] = core.authentication.sessionId;

    if ((_obj['session_id'] == null) && error) {
      throw new StateError(
          "Can't use this method without having a session ID.");
    }
  }

  void add(String name, dynamic value) {
    if (value != null) {
      if (value is Iterable) {
        if (value.length > 0) {
          _obj[name] = value.join(',');
        }
      } else {
        _obj[name] = value.toString();
      }
    }
  }

  String toString() {
    List query = new List();
    _obj.forEach((String k, dynamic v) {
      query.add('$k=' + Uri.encodeQueryComponent(v.toString()));
    });
    return query.join('&');
  }
}
