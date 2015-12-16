// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The tmdb library for web app use.
///
/// Add documentation here?
library tmdb.io;

import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:tmdb/core.dart';

class TMDBApi extends TMDBApiCore {
  TMDBApi(String apiKey, {bool https: false}) : super(apiKey, https: https);

  @override Future<String> makeRequest(Request req) async {
    HttpClient client = req.client ?? new HttpClient();
    HttpClientRequest request = await client.openUrl(req.method, req.uri);

    if (req.method == 'POST') {
      request.add(req.data.codeUnits);
      await request.flush();
    }

    HttpClientResponse response = await request.close();

    if (response.statusCode == 429) {
      // The request rate limit has been exceeded. Let's retry after the
      // number of seconds that we get from the respinse headers, plus an
      // extra 500 ms for safety.
      int retryAfter = int.parse(response.headers.value('Retry-After'));
      print("Retry-After: $retryAfter");
      Duration delay = new Duration(milliseconds: 500 + 1000 * retryAfter);
      return await new Future.delayed(delay, () => makeRequest(req..client = client));
    } else {
      client.close(force: true);
      List<int> resp =
          await response.fold([], (List prev, elem) => prev..addAll(elem));
      // return new String.fromCharCodes(resp);
      return UTF8.decode(resp);
    }
  }
}
