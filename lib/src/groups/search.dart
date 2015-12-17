// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Search' API calls
class Search {
  final TMDBApiCore _core;

  Search(this._core);

  /// Search for companies by name.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.search.company('amblin');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.search.company('amblin', page: 2);
  Future<Map> company(String query, {int page}) {
    Params params = new Params();
    _checkNotNull(query, 'query');
    params.add('query', query);
    params.add('page', page);
    return _core._query('search/company', params: params);
  }

  /// Search for collections by name.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.search.collection('future');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.search.collection('future', language: 'es');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.search.collection('future', page: 2);
  Future<Map> collection(String query, {int page, String language}) {
    Params params = new Params();
    _checkNotNull(query, 'query');
    params.add('query', query);
    params.add('page', page);
    params.add('language', language);
    return _core._query('search/collection', params: params);
  }

  /// Search for keywords by name.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.search.keyword('clock tower');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.search.keyword('clock tower', page: 2);
  Future<Map> keyword(String query, {int page}) {
    Params params = new Params();
    _checkNotNull(query, 'query');
    params.add('query', query);
    params.add('page', page);
    return _core._query('search/keyword', params: params);
  }

  /// Search for lists by name and description.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.search.list('Sci-Fi');
  ///
  ///     // Include adult results
  ///     Map result = await tmdb.search.list('Sci-Fi', includeAdult: true);
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.search.list('Sci-Fi', page: 2);
  Future<Map> list(String query, {int page, bool includeAdult}) {
    Params params = new Params();
    _checkNotNull(query, 'query');
    params.add('query', query);
    params.add('page', page);
    params.add('include_adult', includeAdult);
    return _core._query('search/list', params: params);
  }

  /// Search for movies by title.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.search.movie('Back to the Future');
  ///
  ///     // Get results for a specific year
  ///     Map result = await tmdb.search.movie('Back to the Future', year: 1990);
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.search.movie('Back to the Future', page: 2);
  ///
  ///     // Include adult results
  ///     Map result = await tmdb.search.movie('Backside to the Future', includeAdult: true);
  Future<Map> movie(String query,
      {int page,
      String language,
      bool includeAdult,
      int year,
      int primaryReleaseYear}) {
    Params params = new Params();
    _checkNotNull(query, 'query');
    params.add('query', query);
    params.add('page', page);
    params.add('language', language);
    params.add('include_adult', includeAdult);
    params.add('year', year);
    params.add('primary_release_year', primaryReleaseYear);
    return _core._query('search/movie', params: params);
  }

  /// Search the movie, tv show and person collections with a single query.
  ///
  /// Each item returned in the result array has a `media_type` field that maps to either movie, tv or person.
  /// Each mapped result is the same response you would get from each independent search.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.search.multi('Back to the Future');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.search.multi('Back to the Future', language: 'es');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.search.multi('Back to the Future', page: 2);
  ///
  ///     // Include adult results
  ///     Map result = await tmdb.search.multi('Backside to the Future', includeAdult: true);
  Future<Map> multi(String query,
      {int page, String language, bool includeAdult}) {
    Params params = new Params();
    _checkNotNull(query, 'query');
    params.add('query', query);
    params.add('page', page);
    params.add('language', language);
    params.add('include_adult', includeAdult);
    return _core._query('search/multi', params: params);
  }

  /// Search for people by name.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.search.person('Christopher Lloyd');
  ///
  ///     // Include adult results
  ///     Map result = await tmdb.search.person('Christopher Lloyd', includeAdult: true);
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.search.person('Christopher Lloyd', page: 2);
  Future<Map> person(String query,
      {int page, bool includeAdult, String searchType}) {
    Params params = new Params();
    _checkNotNull(query, 'query');
    params.add('query', query);
    params.add('page', page);
    params.add('include_adult', includeAdult);
    params.add('search_type', searchType);
    return _core._query('search/list', params: params);
  }

  /// Alias for [Search.person].
  Future<Map> people(String query,
      {int page, bool includeAdult, String searchType}) {
    return person(query,
        page: page, includeAdult: includeAdult, searchType: searchType);
  }

  /// Search for TV shows by title.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.search.tv('Back to the Future');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.search.tv('Back to the Future', language: 'es');
  ///
  ///     // Get results that first aired a certain year
  ///     Map result = await tmdb.search.tv('Back to the Future', firstAirDateYear: 1991);
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.search.tv('Back to the Future', page: 2);
  Future<Map> tv(String query,
      {int page, String language, int firstAirDateYear, String searchType}) {
    Params params = new Params();
    _checkNotNull(query, 'query');
    params.add('query', query);
    params.add('page', page);
    params.add('language', language);
    params.add('first_air_date_year', firstAirDateYear);
    params.add('search_type', searchType);
    return _core._query('search/tv', params: params);
  }
}
