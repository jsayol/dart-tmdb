// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Movies' API calls
class Movies {
  final TMDBApiCore _core;

  Movies(this._core);

  /// Get the basic movie information for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getInfo('105');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.movies.getInfo('105', language: 'es');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map result = await tmdb.movies.getInfo('105', append: ['trailers', 'reviews']);
  Future<Map> getInfo(String id, {String language, List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'language', value: language);
    _addParam(params, 'append_to_response', list: append);
    return _core.doQuery('movie/$id', params: params);
  }

  /// This method lets a TMDb user account get the status of whether or not the movie has been rated or added to their favourite or movie watch list. A valid session id is required.
  ///
  /// TODO
  Future<Map> getAccountStates(String id) {
    return null;
  }

  /// Get the alternative titles for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getAlternativeTitles('105');
  ///
  ///     // Get results for Russia
  ///     Map result = await tmdb.movies.getAlternativeTitles('105', country: 'ru');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map result = await tmdb.movies.getAlternativeTitles('105', append: ['trailers', 'reviews']);
  Future<Map> getAlternativeTitles(String id,
      {String country, List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'country', value: country);
    _addParam(params, 'append_to_response', list: append);
    return _core.doQuery('movie/$id/alternative_titles', params: params);
  }

  /// Get the cast and crew information for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getCredits('105');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map result = await tmdb.movies.getCredits('105', append: ['trailers', 'reviews']);
  Future<Map> getCredits(String id, {List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'append_to_response', list: append);
    return _core.doQuery('movie/$id/credits', params: params);
  }

  /// Get the images (posters and backdrops) for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getImages('105');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.movies.getImages('105', language: 'es');
  ///
  ///     // Get results in the default language plus in Russian and German.
  ///     // Maximum 5 extra languages per request
  ///     Map result = await tmdb.movies.getImages('105', includeLanguage: ['ru', 'de']);
  ///
  ///     // Get results plus trailers and reviews
  ///     Map result = await tmdb.movies.getInfo('105', append: ['trailers', 'reviews']);
  Future<Map> getImages(String id,
      {String language, List<String> append, List<String> includeLanguage}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'language', value: language);
    _addParam(params, 'append_to_response', list: append);
    _addParam(params, 'include_image_language', list: includeLanguage);
    return _core.doQuery('movie/$id/images', params: params);
  }

  /// Get movie keywords based on its ID.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getKeywords('105');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map result = await tmdb.movies.getKeywords('105', append: ['trailers', 'reviews']);
  Future<Map> getKeywords(String id, {List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'append_to_response', list: append);
    return _core.doQuery('movie/$id/keywords', params: params);
  }

  /// Get the release date and certification information by country for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getReleases('105');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map result = await tmdb.movies.getReleases('105', append: ['trailers', 'reviews']);
  Future<Map> getReleases(String id, {List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'append_to_response', list: append);
    return _core.doQuery('movie/$id/releases', params: params);
  }

  /// Get the videos (trailers, teasers, clips, etc...) for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getVideos('105');
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdb.movies.getVideos('105', language: 'es');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map infoWithAppend = await tmdb.movies.getVideos('105', append: ['trailers', 'reviews']);
  Future<Map> getVideos(String id, {String language, List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'language', value: language);
    _addParam(params, 'append_to_response', list: append);
    return _core.doQuery('movie/$id/videos', params: params);
  }

  /// Get the translations for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getTranslations('105');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map infoWithAppend = await tmdb.movies.getTranslations('105', append: ['trailers', 'reviews']);
  Future<Map> getTranslations(String id, {List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'append_to_response', list: append);
    return _core.doQuery('movie/$id/translations', params: params);
  }

  /// Get the similar movies for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getSimilar('105');
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdb.movies.getSimilar('105', language: 'es');
  ///
  ///     // Get page 2 (minimum 1, maximum 1000)
  ///     Map infoSpanish = await tmdb.movies.getSimilar('105', page: 2);
  ///
  ///     // Get results plus trailers and reviews
  ///     Map infoWithAppend = await tmdb.movies.getSimilar('105', append: ['trailers', 'reviews']);
  Future<Map> getSimilar(String id,
      {int page, String language, List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    _addParam(params, 'append_to_response', list: append);
    return _core.doQuery('movie/$id/similar', params: params);
  }

  /// Get the reviews for a particular movie id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getReviews('105');
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdb.movies.getReviews('105', language: 'es');
  ///
  ///     // Get page 2 (minimum 1, maximum 1000)
  ///     Map infoSpanish = await tmdb.movies.getReviews('105', page: 2);
  ///
  ///     // Get results plus trailers and reviews
  ///     Map infoWithAppend = await tmdb.movies.getReviews('105', append: ['trailers', 'reviews']);
  Future<Map> getReviews(String id,
      {int page, String language, List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    _addParam(params, 'append_to_response', list: append);
    return _core.doQuery('movie/$id/reviews', params: params);
  }

  /// Get the lists that the movie belongs to.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getLists('105');
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdb.movies.getLists('105', language: 'es');
  ///
  ///     // Get page 2 (minimum 1, maximum 1000)
  ///     Map infoSpanish = await tmdb.movies.getLists('105', page: 2);
  ///
  ///     // Get results plus trailers and reviews
  ///     Map infoWithAppend = await tmdb.movies.getLists('105', append: ['trailers', 'reviews']);
  Future<Map> getLists(String id,
      {int page, String language, List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    _addParam(params, 'append_to_response', list: append);
    return _core.doQuery('movie/$id/lists', params: params);
  }

  /// Get the changes for a specific movie id.
  ///
  /// Changes are grouped by key, and ordered by date in descending order. By default, only the last 24 hours of changes are returned. The maximum number of days that can be returned in a single request is 14. The language is present on fields that are translatable.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getChanges('105');
  ///
  ///     // Get results starting from October 21st, 2015
  ///     Map infoSpanish = await tmdb.movies.getChanges('105', startDate: '2015-10-21');
  ///
  ///     // Get results until October 21st, 2015
  ///     Map infoSpanish = await tmdb.movies.getChanges('105', endDate: '2015-10-21');
  Future<Map> getChanges(String id, {String startDate, String endDate}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'start_date', value: startDate);
    _addParam(params, 'end_date', value: endDate);
    return _core.doQuery('movie/$id/changes', params: params);
  }

  /// TThis method lets users create (or delete) a rating on a movie. A valid session id or guest session id is required.
  ///
  /// TODO
  Future<Map> setRating(String id) {
    return null;
  }

  /// Get the latest movie id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getLatest('105');
  Future<Map> getLatest() {
    return _core.doQuery('movie/latest');
  }

  /// Get the list of movies playing that have been, or are being released this week. This list refreshes every day.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getNowPlaying();
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdb.movies.getNowPlaying(language: 'es');
  ///
  ///     // Get page 2 (minimum 1, maximum 1000)
  ///     Map infoSpanish = await tmdb.movies.getNowPlaying(page: 2);
  Future<Map> getNowPlaying({int page, String language}) {
    Map params = {};
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    return _core.doQuery('movie/now_playing', params: params);
  }

  /// Get the list of popular movies on The Movie Database. This list refreshes every day.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getPopular();
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdb.movies.getPopular(language: 'es');
  ///
  ///     // Get page 2 (minimum 1, maximum 1000)
  ///     Map infoSpanish = await tmdb.movies.getPopular(page: 2);
  Future<Map> getPopular({int page, String language}) {
    Map params = {};
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    return _core.doQuery('movie/popular', params: params);
  }

  /// Get the list of top rated movies. By default, this list will only include movies that have 50 or more votes. This list refreshes every day.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getTopRated();
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdb.movies.getTopRated(language: 'es');
  ///
  ///     // Get page 2 (minimum 1, maximum 1000)
  ///     Map infoSpanish = await tmdb.movies.getTopRated(page: 2);
  Future<Map> getTopRated({int page, String language}) {
    Map params = {};
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    return _core.doQuery('movie/top_rated', params: params);
  }

  /// Get the list of upcoming movies by release date. This list refreshes every day.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.movies.getUpcoming();
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdb.movies.getUpcoming(language: 'es');
  ///
  ///     // Get page 2 (minimum 1, maximum 1000)
  ///     Map infoSpanish = await tmdb.movies.getUpcoming(page: 2);
  Future<Map> getUpcoming({int page, String language}) {
    Map params = {};
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    return _core.doQuery('movie/upcoming', params: params);
  }
}
