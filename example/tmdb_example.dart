// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library tmdb.example;

// Import the proper library
import 'package:tmdb/io.dart';

main() async {
  // Create a new TMDBApi instance
  TMDBApi tmdb = new TMDBApi('YOUR_API_KEY_HERE');

  // Get the top rated movies
  Map topRated = await tmdb.movies.getTopRated();

  // Loop through the results and print the title, year, and rating
  topRated['results'].forEach((v) {
    var title = v['title'];
    var year = DateTime.parse(v['release_date']).year;
    var rating = v['vote_average'].toStringAsFixed(1);
    print("$title ($year) * $rating/10");
  });
}
