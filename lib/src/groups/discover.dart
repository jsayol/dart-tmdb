// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Discover' API calls
class Discover {
  final TMDBApiCore _core;

  Discover(this._core);

  /// Discover movies by different types of data like average rating, number of votes, genres and certifications.
  ///
  /// You can get a valid list of certifications from the "certifications" method.
  ///
  /// Refer to the [official API documentation](http://docs.themoviedb.apiary.io/#reference/discover/discovermovie) for information on every available option.
  Future<Map> movies(
      {String certificationCountry,
      String certification,
      String certificationLTE,
      bool includeAdult,
      bool includeVideo,
      String language,
      int page,
      int primaryReleaseYear,
      String primaryReleaseDateGTE,
      String primaryReleaseDateLTE,
      String releaseDateGTE,
      String releaseDateLTE,
      String sortBy,
      int voteCountGTE,
      int voteCountLTE,
      int voteAverageGTE,
      int voteAverageLTE,
      String withCast,
      String withCrew,
      String withCompanies,
      String withGenres,
      String withKeywords,
      String withPeople,
      int year}) {
    Map params = {};
    _addParam(params, 'certification_country', value: certificationCountry);
    _addParam(params, 'certification', value: certification);
    _addParam(params, 'certification.lte', value: certificationLTE);
    _addParam(params, 'include_Adult', value: includeAdult);
    _addParam(params, 'include_video', value: includeVideo);
    _addParam(params, 'language', value: language);
    _addParam(params, 'page', value: page);
    _addParam(params, 'primary_release_year', value: primaryReleaseYear);
    _addParam(params, 'primary_release_Date.gte', value: primaryReleaseDateGTE);
    _addParam(params, 'primary_release_Date.lte', value: primaryReleaseDateLTE);
    _addParam(params, 'release_date.gte', value: releaseDateGTE);
    _addParam(params, 'release_date.lte', value: releaseDateLTE);
    _addParam(params, 'sort_by', value: sortBy);
    _addParam(params, 'vote_count.gte', value: voteCountGTE);
    _addParam(params, 'vote_count.lte', value: voteCountLTE);
    _addParam(params, 'vote_average.gte', value: voteAverageGTE);
    _addParam(params, 'vote_average.lte', value: voteAverageLTE);
    _addParam(params, 'with_cast', value: withCast);
    _addParam(params, 'with_crew', value: withCrew);
    _addParam(params, 'with_companies', value: withCompanies);
    _addParam(params, 'with_genres', value: withGenres);
    _addParam(params, 'with_keywords', value: withKeywords);
    _addParam(params, 'with_people', value: withPeople);
    _addParam(params, 'year', value: year);
    return _core.doQuery('dicover/movie', params: params);
  }

  /// Discover TV shows by different types of data like average rating, number of votes, genres, the network they aired on and air dates.
  ///
  /// Refer to the [official API documentation](http://docs.themoviedb.apiary.io/#reference/discover/discovertv) for information on every available option.
  Future<Map> tv(
      {String airDateGTE,
      String airDateLTE,
      String firstAirDateGTE,
      String firstAirDateLTE,
      int firstAirDateYear,
      String language,
      int page,
      String sortBy,
      String timezone,
      int voteAverageGTE,
      int voteCountGTE,
      String withGenres,
      String withNetworks}) {
    Map params = {};
    _addParam(params, 'air_date.gte', value: airDateGTE);
    _addParam(params, 'air_date.lte', value: airDateLTE);
    _addParam(params, 'first_air_date.gte', value: firstAirDateGTE);
    _addParam(params, 'first_air_date.lte', value: firstAirDateLTE);
    _addParam(params, 'first_air_date_year', value: firstAirDateYear);
    _addParam(params, 'language', value: language);
    _addParam(params, 'page', value: page);
    _addParam(params, 'sort_by', value: sortBy);
    _addParam(params, 'timezone', value: timezone);
    _addParam(params, 'vote_average.gte', value: voteAverageGTE);
    _addParam(params, 'vote_count.gte', value: voteCountGTE);
    _addParam(params, 'with_Genres', value: withGenres);
    _addParam(params, 'with_networks', value: withNetworks);

    return _core.doQuery('discover/tv', params: params);
  }
}
