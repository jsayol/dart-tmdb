// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The core tmdb library .
///
/// Add documentation here?
library tmdb.core;

import 'dart:async';
import 'dart:convert';

part 'src/request.dart';
part 'src/groups.dart';
part 'src/groups/account.dart';
part 'src/groups/authentication.dart';
part 'src/groups/certifications.dart';
part 'src/groups/changes.dart';
part 'src/groups/collections.dart';
part 'src/groups/companies.dart';
part 'src/groups/configuration.dart';
part 'src/groups/credits.dart';
part 'src/groups/discover.dart';
part 'src/groups/find.dart';
part 'src/groups/genres.dart';
part 'src/groups/jobs.dart';
part 'src/groups/keywords.dart';
part 'src/groups/lists.dart';
part 'src/groups/movies.dart';
part 'src/groups/networks.dart';
part 'src/groups/people.dart';
part 'src/groups/reviews.dart';
part 'src/groups/search.dart';
part 'src/groups/timezones.dart';
part 'src/groups/tv.dart';
part 'src/groups/tvepisodes.dart';
part 'src/groups/tvseasons.dart';

/// API for themoviedb.org
abstract class TMDBApiCore {
  final String _apiUriHost = 'api.themoviedb.org';
  final String _apiUriVersion = '3';
  final String _apiUriScheme;
  final String _apiKey;

  Account _account;
  Authentication _authentication;
  Certifications _certifications;
  Changes _changes;
  Collections _collections;
  Companies _companies;
  Configuration _configuration;
  Credits _credits;
  Discover _discover;
  Find _find;
  Genres _genres;
  Jobs _jobs;
  Keywords _keywords;
  Lists _lists;
  Movies _movies;
  Networks _networks;
  People _people;
  Reviews _reviews;
  Search _search;
  Timezones _timezones;
  Tv _tv;
  TvEpisodes _tvEpisodes;
  TvSeasons _tvSeasons;

  // Abstract method to be mplemented either for dart:html or dart:io.
  Future<String> makeRequest(Request);

  // Generic method to query the remote API, given an endpoint and an
  // optional set of parameters.
  Future<Map> doQuery(String endpoint,
      {String method: 'get', Map<String, String> params}) async {
    Request req = new Request(method: method);
    List<String> query = [];

    req.uri = new Uri(
        scheme: _apiUriScheme,
        host: _apiUriHost,
        path: '/$_apiUriVersion/$endpoint');

    if (params != null) {
      params['api_key'] = _apiKey;
    } else {
      params = {'api_key': _apiKey};
    }

    params.forEach((String k, dynamic v) {
      query.add('$k=' + Uri.encodeQueryComponent(v.toString()));
    });

    if (method == 'get') {
      req.uri = req.uri.replace(query: query.join('&'));
    } else if (method == 'post') {
      req.data = query.join('&');
    }

    try {
      String response = await makeRequest(req);
      return JSON.decode(response);
    } catch (e) {
      // TODO: Handle exceptions
    }
  }

  /// Generates a new [TMDBApi] instance with the provided API key.
  ///
  ///     TMDBApi tmdb = new TMDBApi('YOUR_API_KEY_HERE');
  TMDBApiCore(this._apiKey, {bool https: false})
      : _apiUriScheme = "http${https ? 's' : ''}" {
    _account = new Account(this);
    _authentication = new Authentication(this);
    _certifications = new Certifications(this);
    _changes = new Changes(this);
    _collections = new Collections(this);
    _companies = new Companies(this);
    _configuration = new Configuration(this);
    _credits = new Credits(this);
    _discover = new Discover(this);
    _find = new Find(this);
    _genres = new Genres(this);
    _jobs = new Jobs(this);
    _keywords = new Keywords(this);
    _lists = new Lists(this);
    _movies = new Movies(this);
    _networks = new Networks(this);
    _people = new People(this);
    _reviews = new Reviews(this);
    _search = new Search(this);
    _timezones = new Timezones(this);
    _tv = new Tv(this);
    _tvEpisodes = new TvEpisodes(this);
    _tvSeasons = new TvSeasons(this);
  }

  Account get account => _account;
  Authentication get authentication => _authentication;
  Certifications get certifications => _certifications;
  Changes get changes => _changes;
  Collections get collections => _collections;
  Companies get companies => _companies;
  Configuration get configuration => _configuration;
  Credits get credits => _credits;
  Discover get discover => _discover;
  Find get find => _find;
  Genres get genres => _genres;
  Jobs get jobs => _jobs;
  Keywords get keywords => _keywords;
  Lists get lists => _lists;
  Movies get movies => _movies;
  Networks get networks => _networks;
  People get people => _people;
  Reviews get reviews => _reviews;
  Search get search => _search;
  Timezones get timezones => _timezones;
  Tv get tv => _tv;
  TvEpisodes get tvEpisodes => _tvEpisodes;
  TvSeasons get tvSeasons => _tvSeasons;

  /// Alias for [tvEpisodes]
  TvEpisodes get tvepisodes => _tvEpisodes;
  /// Alias for [tvSeasons]
  TvSeasons get tvseasons => _tvSeasons;
}
