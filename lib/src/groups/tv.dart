// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Tv' API calls
class Tv {
  final TMDBApiCore _core;

  Tv(this._core);

  /// Get the primary information about a TV series by id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tv.getInfo('4745');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.tv.getInfo('4745', language: 'es');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.tv.getInfo('4745', page: 2);
  ///
  ///     // Get results plus credits and images
  ///     Map result = await tmdb.tv.getInfo('4745', append: ['credits', 'images']);
  Future<Map> getInfo(String id,
      {int page, String language, List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    _addParam(params, 'append_to_response', list: append);
    return _core._query('tv/$id', params: params);
  }

  /// This method lets users get the status of whether or not the TV show has been rated or added to their favourite or watch lists.
  ///
  /// A valid session id is required.
  ///
  /// TODO
  Future<Map> getAccountStates(String id) {
    return null;
  }

  /// Get the alternative titles for a specific show ID.
  ///
  ///     // Usage
  ///     Map result = await tmdb.tv.getAlternativeTitles('4745');
  Future<Map> getAlternativeTitles(String id) {
    _checkNotNull(id, 'id');
    return _core._query('tv/$id/alternative_titles');
  }

  /// Get the changes for a specific TV show id.
  ///
  /// Changes are grouped by key, and ordered by date in descending order. By default, only the last 24 hours of changes are returned. The maximum number of days that can be returned in a single request is 14. The language is present on fields that are translatable.
  ///
  /// TV changes are different than movie changes in that there are some edits on seasons and episodes that will create a change entry at the show level. They can be found under the `season` and `episode` keys. These keys will contain a series_id and episode_id. You can use the [TvSeasons.getChanges()] and [TvEpisodes.getChanges()] methods to look up these specific changes.
  ///     // Basic usage
  ///     Map result = await tmdb.tv.getChanges('4745');
  ///
  ///     // Get results starting from October 21st, 2015
  ///     Map result = await tmdb.tv.getChanges('4745', startDate: '2015-10-21');
  ///
  ///     // Get results until October 21st, 2015
  ///     Map result = await tmdb.tv.getChanges('4745', endDate: '2015-10-21');
  Future<Map> getChanges(String id, {String startDate, String endDate}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'start_date', value: startDate);
    _addParam(params, 'end_date', value: endDate);
    return _core._query('tv/$id/changes', params: params);
  }

  /// Get the content ratings for a specific TV show id.
  ///
  ///     // Usage
  ///     Map result = await tmdb.tv.getContentRatings('4745');
  Future<Map> getContentRatings(String id) {
    _checkNotNull(id, 'id');
    return _core._query('tv/$id/content_ratings');
  }

  /// Get the cast and crew information for a specific movie id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tv.getCredits('4745');
  ///
  ///     // Get results plus keywords and images
  ///     Map result = await tmdb.tv.getCredits('4745', append: ['keywords', 'images']);
  Future<Map> getCredits(String id, {List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'append_to_response', list: append);
    return _core._query('tv/$id/credits', params: params);
  }

  /// Get the external ids that we have stored for a TV series.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tv.getExternalIds('4745');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.tv.getExternalIds('4745', language: 'es');
  Future<Map> getExternalIds(String id, {String language}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'language', value: language);
    return _core._query('tv/$id/external_ids', params: params);
  }

  /// Get the images (posters and backdrops) for a TV series.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tv.getImages('4745');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.tv.getImages('4745', language: 'es');
  ///
  ///     // Get results in the default language plus in Russian and German.
  ///     Map result = await tmdb.tv.getImages('4745', includeLanguage: ['ru', 'de']);
  Future<Map> getImages(String id,
      {String language, List<String> includeLanguage}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'language', value: language);
    _addParam(params, 'include_image_language', list: includeLanguage);
    return _core._query('tv/$id/images', params: params);
  }

  /// Get the plot keywords for a specific TV show id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tv.getKeywords('4745');
  ///
  ///     // Get results plus credits and images
  ///     Map result = await tmdb.tv.getKeywords('4745', append: ['credits', 'images']);
  Future<Map> getKeywords(String id, {List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'append_to_response', list: append);
    return _core._query('tv/$id/keywords', params: params);
  }

  /// This method lets users create a rating on a TV series.
  ///
  /// A valid session id or guest session id is required.
  ///
  /// TODO
  Future<Map> setRating(String id) {
    return null;
  }

  /// This method lets users delete a rating on a TV series.
  ///
  /// A valid session id or guest session id is required.
  ///
  /// TODO
  Future<Map> deleteRating(String id) {
    return null;
  }

  /// Get the similar TV shows for a specific tv id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tv.getSimilar('4745');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.tv.getSimilar('4745', language: 'es');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.tv.getSimilar('4745', page: 2);
  ///
  ///     // Get results plus credits and images
  ///     Map result = await tmdb.tv.getSimilar('4745', append: ['credits', 'images']);
  Future<Map> getSimilar(String id,
      {int page, String language, List<String> append}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    _addParam(params, 'append_to_response', list: append);
    return _core._query('tv/$id/similar', params: params);
  }

  /// Get the list of translations that exist for a TV series.
  ///
  /// These translations cascade down to the episode level.
  ///
  ///     // Usage
  ///     Map result = await tmdb.tv.getTranslations('4745');
  Future<Map> getTranslations(String id) {
    _checkNotNull(id, 'id');
    return _core._query('tv/$id/translations');
  }

  /// Get the videos that have been added to a TV series (trailers, opening credits, etc...)
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tv.getVideos('4745');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.tv.getVideos('4745', language: 'es');
  Future<Map> getVideos(String id, {String language}) {
    Map params = {};
    _checkNotNull(id, 'id');
    _addParam(params, 'language', value: language);
    return _core._query('tv/$id/videos', params: params);
  }

  /// Get the latest TV show id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tv.getLatest('105');
  Future<Map> getLatest() {
    return _core._query('tv/latest');
  }

  /// Get the list of TV shows that are currently on the air.
  ///
  /// This query looks for any TV show that has an episode with an air date in the next 7 days.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tv.getOnTheAir();
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.tv.getOnTheAir(language: 'es');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.tv.getOnTheAir(page: 2);
  Future<Map> getOnTheAir({int page, String language}) {
    Map params = {};
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    return _core._query('tv/on_the_air', params: params);
  }

  /// Get the list of TV shows that are currently on the air.
  ///
  /// This query looks for any TV show that has an episode with an air date in the next 7 days.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tv.getAiringToday();
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.tv.getAiringToday(language: 'es');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.tv.getAiringToday(page: 2);
  Future<Map> getAiringToday({int page, String language, String timezone}) {
    Map params = {};
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    _addParam(params, 'timezone', value: timezone);
    return _core._query('tv/on_the_air', params: params);
  }

  /// Get the list of top rated TV shows.
  ///
  /// By default, this list will only include TV shows that have 2 or more votes. This list refreshes every day.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tv.getTopRated();
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.tv.getTopRated(language: 'es');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.tv.getTopRated(page: 2);
  Future<Map> getTopRated({int page, String language}) {
    Map params = {};
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    return _core._query('tv/top_rated', params: params);
  }

  /// Get the list of popular TV shows.
  ///
  /// This list refreshes every day.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tv.getPopular();
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.tv.getPopular(language: 'es');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.tv.getPopular(page: 2);
  Future<Map> getPopular({int page, String language}) {
    Map params = {};
    _addParam(params, 'page', value: page);
    _addParam(params, 'language', value: language);
    return _core._query('tv/popular', params: params);
  }
}
