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
    _Params params = new _Params();
    params['certification_country'] = certificationCountry;
    params['certification'] = certification;
    params['certification.lte'] = certificationLTE;
    params['include_Adult'] = includeAdult;
    params['include_video'] = includeVideo;
    params['language'] = language;
    params['page'] = page;
    params['primary_release_year'] = primaryReleaseYear;
    params['primary_release_Date.gte'] = primaryReleaseDateGTE;
    params['primary_release_Date.lte'] = primaryReleaseDateLTE;
    params['release_date.gte'] = releaseDateGTE;
    params['release_date.lte'] = releaseDateLTE;
    params['sort_by'] = sortBy;
    params['vote_count.gte'] = voteCountGTE;
    params['vote_count.lte'] = voteCountLTE;
    params['vote_average.gte'] = voteAverageGTE;
    params['vote_average.lte'] = voteAverageLTE;
    params['with_cast'] = withCast;
    params['with_crew'] = withCrew;
    params['with_companies'] = withCompanies;
    params['with_genres'] = withGenres;
    params['with_keywords'] = withKeywords;
    params['with_people'] = withPeople;
    params['year'] = year;
    return _core._query('dicover/movie', params: params);
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
    _Params params = new _Params();
    params['air_date.gte'] = airDateGTE;
    params['air_date.lte'] = airDateLTE;
    params['first_air_date.gte'] = firstAirDateGTE;
    params['first_air_date.lte'] = firstAirDateLTE;
    params['first_air_date_year'] = firstAirDateYear;
    params['language'] = language;
    params['page'] = page;
    params['sort_by'] = sortBy;
    params['timezone'] = timezone;
    params['vote_average.gte'] = voteAverageGTE;
    params['vote_count.gte'] = voteCountGTE;
    params['with_Genres'] = withGenres;
    params['with_networks'] = withNetworks;

    return _core._query('discover/tv', params: params);
  }
}
