// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the parameters that will be passed to the query.
class _Params extends Object with MapMixin {
  Map<String, dynamic> _obj = new Map<String, dynamic>();
  bool needsSession = false;
  bool needsGuestSession = false;
  bool needsEitherSession = false;

  _Params();
  _Params.withSession() : needsSession = true;
  _Params.withGuestSession() : needsGuestSession = true;
  _Params.withEitherSession() : needsEitherSession = true;

  List<String> get keys => _obj.keys;

  bool get hasElements => _obj.length > 0;

  operator [](String name) => _obj[name];

  operator []=(String name, dynamic value) {
    if (value != null) {
      if (value is bool) {
        _obj[name] = value;
      }
      else if (value is Iterable) {
        if (value.length > 0) {
          _obj[name] = value.join(',');
        }
      } else {
        _obj[name] = value.toString();
      }
    }
  }

  dynamic remove(Object name) {
    String v = _obj[name];
    _obj.remove(name);
    return v;
  }

  void clear() {
    _obj.clear();
  }

  String toString() {
    List query = new List();
    _obj.forEach((String k, dynamic v) {
      query.add('$k=' + Uri.encodeQueryComponent(v.toString()));
    });
    return query.join('&');
  }

  String toJSON() => JSON.encode(_obj);

}
