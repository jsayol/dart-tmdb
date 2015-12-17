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
    Params params = new Params();
    params.add('certification_country', certificationCountry);
    params.add('certification', certification);
    params.add('certification.lte', certificationLTE);
    params.add('include_Adult', includeAdult);
    params.add('include_video', includeVideo);
    params.add('language', language);
    params.add('page', page);
    params.add('primary_release_year', primaryReleaseYear);
    params.add('primary_release_Date.gte', primaryReleaseDateGTE);
    params.add('primary_release_Date.lte', primaryReleaseDateLTE);
    params.add('release_date.gte', releaseDateGTE);
    params.add('release_date.lte', releaseDateLTE);
    params.add('sort_by', sortBy);
    params.add('vote_count.gte', voteCountGTE);
    params.add('vote_count.lte', voteCountLTE);
    params.add('vote_average.gte', voteAverageGTE);
    params.add('vote_average.lte', voteAverageLTE);
    params.add('with_cast', withCast);
    params.add('with_crew', withCrew);
    params.add('with_companies', withCompanies);
    params.add('with_genres', withGenres);
    params.add('with_keywords', withKeywords);
    params.add('with_people', withPeople);
    params.add('year', year);
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
    Params params = new Params();
    params.add('air_date.gte', airDateGTE);
    params.add('air_date.lte', airDateLTE);
    params.add('first_air_date.gte', firstAirDateGTE);
    params.add('first_air_date.lte', firstAirDateLTE);
    params.add('first_air_date_year', firstAirDateYear);
    params.add('language', language);
    params.add('page', page);
    params.add('sort_by', sortBy);
    params.add('timezone', timezone);
    params.add('vote_average.gte', voteAverageGTE);
    params.add('vote_count.gte', voteCountGTE);
    params.add('with_Genres', withGenres);
    params.add('with_networks', withNetworks);

    return _core._query('discover/tv', params: params);
  }
}
