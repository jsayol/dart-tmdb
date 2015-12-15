// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library tmdb.test;

import 'package:tmdb/io.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    TmdbApi tmdbApi;

    setUp(() {
      tmdbApi = new TmdbApi('306b27f6d4bfe68442cd66152d01a134');
    });

    test('First Test', () {
      expect(tmdbApi.account.get(), isTrue);
    });
  });
}
