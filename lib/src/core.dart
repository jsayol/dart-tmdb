// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library tmdb.core;

import 'dart:async';
import 'dart:convert';

part 'class/account.dart';
part 'class/authentication.dart';
part 'class/certifications.dart';
part 'class/changes.dart';
part 'class/collections.dart';
part 'class/companies.dart';
part 'class/configuration.dart';
part 'class/credits.dart';
part 'class/discover.dart';
part 'class/find.dart';
part 'class/genres.dart';
part 'class/jobs.dart';
part 'class/keywords.dart';
part 'class/lists.dart';
part 'class/movies.dart';
part 'class/networks.dart';
part 'class/people.dart';
part 'class/reviews.dart';
part 'class/search.dart';
part 'class/timezones.dart';
part 'class/tv.dart';
part 'class/tvepisodes.dart';
part 'class/tvseasons.dart';
part 'request.dart';

/// API for themoviedb.org
abstract class TmdbApiCore {
  final String _apiUriHost = 'api.themoviedb.org';
  final String _apiUriVersion = '3';
  final String _apiUriScheme;
  final String _apiKey;

  _Account _account;
  _Authentication _authentication;
  _Certifications _certifications;
  _Changes _changes;
  _Collections _collections;
  _Companies _companies;
  _Configuration _configuration;
  _Credits _credits;
  _Discover _discover;
  _Find _find;
  _Genres _genres;
  _Jobs _jobs;
  _Keywords _keywords;
  _Lists _lists;
  _Movies _movies;
  _Networks _networks;
  _People _people;
  _Reviews _reviews;
  _Search _search;
  _Timezones _timezones;
  _Tv _tv;
  _Tvepisodes _tvepisodes;
  _Tvseasons _tvseasons;

  // Abstract method to be mplemented either for dart:html or dart:io.
  Future<String> makeRequest(Request);

  // Generic method to query the remote API, given an endpoint and an
  // optional set of parameters.
  Future doQuery(String endpoint,
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

    params.forEach((String k, String v) {
      query.add('$k=' + Uri.encodeQueryComponent(v));
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

  /// Generates a new [TmdbApi] instance with the provided API key.
  ///
  ///     TmdbApi tmdb = new TmdbApi('YOUR_API_KEY_HERE');
  TmdbApiCore(this._apiKey, {bool https: false})
      : _apiUriScheme = "http${https ? 's' : ''}" {
    _account = new _Account(this);
    _authentication = new _Authentication(this);
    _certifications = new _Certifications(this);
    _changes = new _Changes(this);
    _collections = new _Collections(this);
    _companies = new _Companies(this);
    _configuration = new _Configuration(this);
    _credits = new _Credits(this);
    _discover = new _Discover(this);
    _find = new _Find(this);
    _genres = new _Genres(this);
    _jobs = new _Jobs(this);
    _keywords = new _Keywords(this);
    _lists = new _Lists(this);
    _movies = new _Movies(this);
    _networks = new _Networks(this);
    _people = new _People(this);
    _reviews = new _Reviews(this);
    _search = new _Search(this);
    _timezones = new _Timezones(this);
    _tv = new _Tv(this);
    _tvepisodes = new _Tvepisodes(this);
    _tvseasons = new _Tvseasons(this);
  }

  _Account get account => _account;
  _Authentication get authentication => _authentication;
  _Certifications get certifications => _certifications;
  _Changes get changes => _changes;
  _Collections get collections => _collections;
  _Companies get companies => _companies;
  _Configuration get configuration => _configuration;
  _Credits get credits => _credits;
  _Discover get discover => _discover;
  _Find get find => _find;
  _Genres get genres => _genres;
  _Jobs get jobs => _jobs;
  _Keywords get keywords => _keywords;
  _Lists get lists => _lists;
  _Movies get movies => _movies;
  _Networks get networks => _networks;
  _People get people => _people;
  _Reviews get reviews => _reviews;
  _Search get search => _search;
  _Timezones get timezones => _timezones;
  _Tv get tv => _tv;
  _Tvepisodes get tvepisodes => _tvepisodes;
  _Tvseasons get tvseasons => _tvseasons;
}
