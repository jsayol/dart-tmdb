// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

void _checkNotNull(value, String name) {
  if (value == null) {
    throw new ArgumentError.notNull(name);
  }
}
