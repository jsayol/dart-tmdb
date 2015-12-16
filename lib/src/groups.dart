// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

void _addParam(Map params, String name, {dynamic value, List list}) {
  if (value != null) {
    params[name] = value.toString();
  } else if (list != null) {
    if (list.length > 0) {
      params[name] = list.join(',');
    }
  }
}

void _checkNotNull(value, String name) {
  if (value == null) {
    throw new ArgumentError.notNull(name);
  }
}
