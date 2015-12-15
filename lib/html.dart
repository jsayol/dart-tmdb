// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The tmdb library for web app use.
///
/// Add documentation here?
library tmdb.html;

import 'dart:html';
import 'dart:async';

import 'package:tmdb/src/core.dart';

class TmdbApi extends TmdbApiCore {
  TmdbApi(String apiKey, {bool https: false}) : super(apiKey, https: https);

  @override Future<String> makeRequest(Request req) async {
    HttpRequest httpreq = await HttpRequest.request(req.uri.toString(),
        method: req.method, sendData: req.data, responseType: 'text');
    print("is string? ${httpreq.responseText is String}");
    return httpreq.responseText;
  }
}
