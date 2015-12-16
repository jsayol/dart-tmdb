// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The tmdb library for web app use.
///
/// Add documentation here?
library tmdb.html;

import 'dart:html';
import 'dart:async';

import 'package:tmdb/core.dart';

class TMDBApi extends TMDBApiCore {
  TMDBApi(String apiKey, {bool https: false}) : super(apiKey, https: https);

  @override Future<String> makeRequest(Request req) async {
    HttpRequest httpreq;
    try {
      httpreq = await HttpRequest.request(req.uri.toString(),
          method: req.method, sendData: req.data, responseType: 'text');
      return httpreq.responseText;
    } catch (e) {
      if (e.target.status == 429) {
        // The request rate limit has been exceeded. Let's retry after the
        // number of seconds that we get from the response headers, plus an
        // extra 500 ms for safety.
        int retryAfter;
        try {
          retryAfter = int.parse(e.target.responseHeaders['Retry-After']);
        } catch (e) {
          // If the header is missing, we assume 10 seconds
          retryAfter = 10;
        }
        print("Retry-After: $retryAfter");
        Duration delay = new Duration(milliseconds: 500 + 1000 * retryAfter);
        return await new Future.delayed(delay, () => makeRequest(req));
      } else {
        throw e;
      }
    }
  }
}
