// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Movies' API calls
class _Movies {
  final TmdbApiCore _core;

  _Movies(this._core);

  Map _addParam(Map params, String name, value, [bool isList = false]) {
    if (value != null) {
      if (isList) {
        if (value.length > 0) {
          params[name] = value.join(',');
        }
      } else {
        params[name] = value;
      }
    }
  }

  /// Get the basic movie information for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getById('105');
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdbApi.movies.getById('105', language: 'es');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map infoWithAppend = await tmdbApi.movies.getById('105', append: ['trailers', 'reviews']);
  Map getInfo(String id, {String language, List<String> append}) {
    Map params = {};
    _addParam(params, 'language', language);
    _addParam(params, 'append_to_response', append, true);
    return _core.doQuery('movie/$id', params: params);
  }

  /// This method lets a TMDb user account get the status of whether or not the movie has been rated or added to their favourite or movie watch list. A valid session id is required.
  ///
  @todo
  Map getAccountStates(String id) {}

  /// Get the alternative titles for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getAlternativeTitles('105');
  ///
  ///     // Get results for Russia
  ///     Map info = await tmdbApi.movies.getAlternativeTitles('105', country: 'ru');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map info = await tmdbApi.movies.getAlternativeTitles('105', append: ['trailers', 'reviews']);
  Map getAlternativeTitles(String id, {String country, List<String> append}) {
    Map params = {};
    _addParam(params, 'country', country);
    _addParam(params, 'append_to_response', append, true);
    return _core.doQuery('movie/$id/alternative_titles', params: params);
  }

  /// Get the cast and crew information for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getCredits('105');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map info = await tmdbApi.movies.getCredits('105', append: ['trailers', 'reviews']);
  Map getCredits(String id, {List<String> append}) {
    Map params = {};
    _addParam(params, 'append_to_response', append, true);
    return _core.doQuery('movie/$id/credits', params: params);
  }

  /// Get the images (posters and backdrops) for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getImages('105');
  ///
  ///     // Get results in Spanish
  ///     Map info = await tmdbApi.movies.getImages('105', language: 'es');
  ///
  ///     // Get results in the default language plus in Russian and German.
  ///     // Maximum 5 extra languages per request
  ///     Map info = await tmdbApi.movies.getImages('105', includeLanguage: ['ru', 'de']);
  ///
  ///     // Get results plus trailers and reviews
  ///     Map info = await tmdbApi.movies.getInfo('105', append: ['trailers', 'reviews']);
  Map getImages(String id,
      {String language, List<String> append, List<String> includeLanguage}) {
    Map params = {};
    _addParam(params, 'language', language);
    _addParam(params, 'append_to_response', append, true);
    _addParam(params, 'include_image_language', includeLanguage, true);
    return _core.doQuery('movie/$id/images', params: params);
  }

  /// Get movie keywords based on its ID.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getKeywords('105');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map info = await tmdbApi.movies.getKeywords('105', append: ['trailers', 'reviews']);
  Map getKeywords(String id, {List<String> append}) {
    Map params = {};
    _addParam(params, 'append_to_response', append, true);
    return _core.doQuery('movie/$id/keywords', params: params);
  }

  /// Get the release date and certification information by country for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getReleases('105');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map info = await tmdbApi.movies.getReleases('105', append: ['trailers', 'reviews']);
  Map getReleases(String id, {List<String> append}) {
    Map params = {};
    _addParam(params, 'append_to_response', append, true);
    return _core.doQuery('movie/$id/releases', params: params);
  }

  /// Get the videos (trailers, teasers, clips, etc...) for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getVideos('105');
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdbApi.movies.getVideos('105', language: 'es');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map infoWithAppend = await tmdbApi.movies.getVideos('105', append: ['trailers', 'reviews']);
  Map getVideos(String id, {String language, List<String> append}) {
    Map params = {};
    _addParam(params, 'language', language);
    _addParam(params, 'append_to_response', append, true);
    return _core.doQuery('movie/$id/videos', params: params);
  }

  /// Get the translations for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getTranslations('105');
  ///
  ///     // Get results plus trailers and reviews
  ///     Map infoWithAppend = await tmdbApi.movies.getTranslations('105', append: ['trailers', 'reviews']);
  Map getTranslations(String id, {List<String> append}) {
    Map params = {};
    _addParam(params, 'append_to_response', append, true);
    return _core.doQuery('movie/$id/translations', params: params);
  }

  /// Get the similar movies for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getSimilar('105');
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdbApi.movies.getSimilar('105', language: 'es');
  ///
  ///     // Get page 2 (minimum 1, maximum 1000)
  ///     Map infoSpanish = await tmdbApi.movies.getSimilar('105', page: 2);
  ///
  ///     // Get results plus trailers and reviews
  ///     Map infoWithAppend = await tmdbApi.movies.getSimilar('105', append: ['trailers', 'reviews']);
  Map getSimilar(String id, {int page, String language, List<String> append}) {
    Map params = {};
    _addParam(params, 'page', page);
    _addParam(params, 'language', language);
    _addParam(params, 'append_to_response', append, true);
    return _core.doQuery('movie/$id/similar', params: params);
  }

  /// Get the reviews for a particular movie id.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getReviews('105');
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdbApi.movies.getReviews('105', language: 'es');
  ///
  ///     // Get page 2 (minimum 1, maximum 1000)
  ///     Map infoSpanish = await tmdbApi.movies.getReviews('105', page: 2);
  ///
  ///     // Get results plus trailers and reviews
  ///     Map infoWithAppend = await tmdbApi.movies.getReviews('105', append: ['trailers', 'reviews']);
  Map getReviews(String id, {int page, String language, List<String> append}) {
    Map params = {};
    _addParam(params, 'page', page);
    _addParam(params, 'language', language);
    _addParam(params, 'append_to_response', append, true);
    return _core.doQuery('movie/$id/reviews', params: params);
  }

  /// Get the lists that the movie belongs to.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getLists('105');
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdbApi.movies.getLists('105', language: 'es');
  ///
  ///     // Get page 2 (minimum 1, maximum 1000)
  ///     Map infoSpanish = await tmdbApi.movies.getLists('105', page: 2);
  ///
  ///     // Get results plus trailers and reviews
  ///     Map infoWithAppend = await tmdbApi.movies.getLists('105', append: ['trailers', 'reviews']);
  Map getLists(String id, {int page, String language, List<String> append}) {
    Map params = {};
    _addParam(params, 'page', page);
    _addParam(params, 'language', language);
    _addParam(params, 'append_to_response', append, true);
    return _core.doQuery('movie/$id/lists', params: params);
  }

  /// Get the changes for a specific movie id.
  ///
  /// Changes are grouped by key, and ordered by date in descending order. By default, only the last 24 hours of changes are returned. The maximum number of days that can be returned in a single request is 14. The language is present on fields that are translatable.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getChanges('105');
  ///
  ///     // Get results starting from October 21st, 2015
  ///     Map infoSpanish = await tmdbApi.movies.getChanges('105', startDate: '2015-10-21');
  ///
  ///     // Get results until October 21st, 2015
  ///     Map infoSpanish = await tmdbApi.movies.getChanges('105', endDate: '2015-10-21');
  Map getChanges(String id, {String startDate, String endDate}) {
    Map params = {};
    _addParam(params, 'start_date', startDate);
    _addParam(params, 'end_date', endDate);
    return _core.doQuery('movie/$id/changes', params: params);
  }

  /// TThis method lets users create (or delete) a rating on a movie. A valid session id or guest session id is required.
  ///
  @todo
  Map setRating(String id) {}

  /// Get the latest movie id.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getLatest('105');
  Map getLatest() {
    return _core.doQuery('movie/$id/latest');
  }

  /// Get the list of movies playing that have been, or are being released this week. This list refreshes every day.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getNowPlaying();
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdbApi.movies.getNowPlaying(language: 'es');
  ///
  ///     // Get page 2 (minimum 1, maximum 1000)
  ///     Map infoSpanish = await tmdbApi.movies.getNowPlaying(page: 2);
  Map getNowPlaying({int page, String language}) {
    Map params = {};
    _addParam(params, 'page', page);
    _addParam(params, 'language', language);
    _addParam(params, 'append_to_response', append, true);
    return _core.doQuery('movie/$id/now_playing', params: params);
  }

  /// Get the list of popular movies on The Movie Database. This list refreshes every day.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getPopular();
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdbApi.movies.getPopular(language: 'es');
  ///
  ///     // Get page 2 (minimum 1, maximum 1000)
  ///     Map infoSpanish = await tmdbApi.movies.getPopular(page: 2);
  Map getPopular({int page, String language}) {
    Map params = {};
    _addParam(params, 'page', page);
    _addParam(params, 'language', language);
    return _core.doQuery('movie/$id/popular', params: params);
  }

  /// Get the list of top rated movies. By default, this list will only include movies that have 50 or more votes. This list refreshes every day.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getTopRated();
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdbApi.movies.getTopRated(language: 'es');
  ///
  ///     // Get page 2 (minimum 1, maximum 1000)
  ///     Map infoSpanish = await tmdbApi.movies.getTopRated(page: 2);
  Map getTopRated({int page, String language}) {
    Map params = {};
    _addParam(params, 'page', page);
    _addParam(params, 'language', language);
    return _core.doQuery('movie/$id/top_rated', params: params);
  }

  /// Get the list of upcoming movies by release date. This list refreshes every day.
  ///
  ///     // Basic usage
  ///     Map info = await tmdbApi.movies.getUpcoming();
  ///
  ///     // Get results in Spanish
  ///     Map infoSpanish = await tmdbApi.movies.getUpcoming(language: 'es');
  ///
  ///     // Get page 2 (minimum 1, maximum 1000)
  ///     Map infoSpanish = await tmdbApi.movies.getUpcoming(page: 2);
  Map getUpcoming({int page, String language}) {
    Map params = {};
    _addParam(params, 'page', page);
    _addParam(params, 'language', language);
    return _core.doQuery('movie/$id/upcoming', params: params);
  }
}
