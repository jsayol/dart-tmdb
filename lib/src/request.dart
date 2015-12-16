// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

class Request {
  Uri uri;
  String method;
  String data;
  var client;

  Request({Uri uri, String method, String data})
      : this.uri = uri,
        this.method = method,
        this.data = data;
}
