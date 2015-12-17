// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'TvSeasons' API calls
class TvSeasons {
  final TMDBApiCore _core;

  TvSeasons(this._core);

  /// Get the primary information about a TV season by its season number.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tvSeasons.getInfo('4745', 1);
  ///
  ///     // Get results for the second season in Spanish
  ///     Map result = await tmdb.tvSeasons.getInfo('4745', 2, language: 'es');
  ///
  ///     // Get results plus images and videos
  ///     Map result = await tmdb.tvSeasons.getInfo('4745', 1, append: ['images', 'videos']);
  Future<Map> getInfo(String showId, int seasonNumber,
      {String language, List<String> append}) {
    Params params = new Params();
    _checkNotNull(showId, 'showId');
    _checkNotNull(seasonNumber, 'seasonNumber');
    params.add('language', language);
    params.add('append_to_response', append);
    return _core._query('tv/$showId/season/$seasonNumber', params: params);
  }

  /// Look up a TV season's changes by season ID.
  ///
  /// This method is used in conjunction with the [Tv.getChanges()] method. This method uses the `season_id` value found in the change entries.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tvSeasons.getChanges('9569');
  ///
  ///     // Get results starting from October 21st, 2015
  ///     Map result = await tmdb.tvSeasons.getChanges('9569', startDate: '2015-10-21');
  ///
  ///     // Get results until October 21st, 2015
  ///     Map result = await tmdb.tvSeasons.getChanges('9569', endDate: '2015-10-21');
  Future<Map> getChanges(String id, {String startDate, String endDate}) {
    Params params = new Params();
    _checkNotNull(id, 'id');
    params.add('start_date', startDate);
    params.add('end_date', endDate);
    return _core._query('tv/season/$id/changes', params: params);
  }

  /// This method lets users get the status of whether or not the TV episodes of a season have been rated.
  ///
  /// A valid session id is required.
  ///
  /// TODO
  Future<Map> getAccountStates(String showId, int seasonNumber) {
    return null;
  }

  /// Get the cast & crew credits for a TV season by season number.
  ///
  ///     // Usage
  ///     Map result = await tmdb.tvSeasons.getCredits('4745', 1);
  Future<Map> getCredits(String showId, int seasonNumber) {
    _checkNotNull(showId, 'showId');
    _checkNotNull(seasonNumber, 'seasonNumber');
    return _core._query('tv/$showId/season/$seasonNumber/credits');
  }

  /// Get the external ids that we have stored for a TV season by season number.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tvSeasons.getExternalIds('4745', 1);
  ///
  ///     // Get results for the second season in Spanish
  ///     Map result = await tmdb.tvSeasons.getExternalIds('4745', 2, language: 'es');
  Future<Map> getExternalIds(String showId, int seasonNumber,
      {String language}) {
    Params params = new Params();
    _checkNotNull(showId, 'showId');
    _checkNotNull(seasonNumber, 'seasonNumber');
    params.add('language', language);
    return _core._query('tv/$showId/season/$seasonNumber/external_ids',
        params: params);
  }

  /// Get the images (posters) that we have stored for a TV season by season number.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tvSeasons.getImages('4745', 1);
  ///
  ///     // Get results for the second season in Spanish
  ///     Map result = await tmdb.tvSeasons.getImages('4745', 2, language: 'es');
  ///
  ///     // Get results in the default language plus in Russian and German.
  ///     Map result = await tmdb.tvSeasons.getImages('4745', 1, includeLanguage: ['ru', 'de']);
  Future<Map> getImages(String showId, int seasonNumber,
      {String language, List<String> includeLanguage}) {
    Params params = new Params();
    _checkNotNull(showId, 'showId');
    _checkNotNull(seasonNumber, 'seasonNumber');
    params.add('language', language);
    params.add('include_image_language', includeLanguage);
    return _core._query('tv/$showId/season/$seasonNumber/images',
        params: params);
  }

  /// Get the videos that have been added to a TV season (trailers, teasers, etc...)
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tvSeasons.getVideos('4745', 1);
  ///
  ///     // Get results for the second season in Spanish
  ///     Map result = await tmdb.tvSeasons.getVideos('4745', 2, language: 'es');
  Future<Map> getVideos(String showId, int seasonNumber, {String language}) {
    Params params = new Params();
    _checkNotNull(showId, 'showId');
    _checkNotNull(seasonNumber, 'seasonNumber');
    params.add('language', language);
    return _core._query('tv/$showId/season/$seasonNumber/videos',
        params: params);
  }
}
