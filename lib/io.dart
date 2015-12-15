// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The tmdb library for web app use.
///
/// Add documentation here?
library tmdb.io;

import 'dart:io';
import 'dart:async';

import 'package:tmdb/src/core.dart';

class TmdbApi extends TmdbApiCore {
  TmdbApi(String apiKey, {bool https: false}) : super(apiKey, https: https);

  @override Future<String> makeRequest(Request req) async {
    HttpClient client = new HttpClient();
    HttpClientRequest request = await client.openUrl(req.method, req.uri);
    if (req.method == 'post') {
      request.add(req.data.codeUnits);
      await request.flush();
    }
    HttpClientResponse response = await request.close();
    client.close();
    List<int> resp = await response.fold([], (List prev, elem)=> prev..addAll(elem));
    return new String.fromCharCodes(resp);
  }
}
