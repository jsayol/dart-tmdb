// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The tmdb library for web app use.
///
/// Add documentation here?
library tmdb.html;

import 'dart:async';

import 'package:http/browser_client.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb/core.dart';

class TMDBApi extends TMDBApiCore {
  TMDBApi(String apiKey, {bool https: false}) : super(apiKey, https: https);

  @override Future<String> handleRequest(http.Request request) async {
    http.Response response =
        await http.Response.fromStream(await new BrowserClient().send(request));
    return await handleResponse(response);
  }
}
