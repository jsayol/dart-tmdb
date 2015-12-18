// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'TvEpisodes' API calls
class TvEpisodes {
  final TMDBApiCore _core;

  TvEpisodes(this._core);

  /// Get the primary information about a TV episode by combination of a season and episode number.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tvEpisodes.getInfo('4745', 1, 5);
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.tvEpisodes.getInfo('4745', 2, 1, language: 'es');
  ///
  ///     // Get results plus images and videos
  ///     Map result = await tmdb.tvEpisodes.getInfo('4745', 1, 1, append: ['images', 'videos']);
  Future<Map> getInfo(String showId, int seasonNumber, int episodeNumber,
      {String language, List<String> append}) {
    _Params params = new _Params();
    _checkNotNull(showId, 'showId');
    _checkNotNull(seasonNumber, 'seasonNumber');
    _checkNotNull(episodeNumber, 'episodeNumber');
    params['language'] = language;
    params['append_to_response'] = append;
    return _core._query(
        'tv/$showId/season/$seasonNumber/episode/$episodeNumber',
        params: params);
  }

  /// Look up a TV season's changes by episode ID.
  ///
  /// This method is used in conjunction with the [Tv.getChanges()] method. This method uses the `episode_id` value found in the change entries.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tvEpisodes.getChanges('9569');
  ///
  ///     // Get results starting from October 21st, 2015
  ///     Map result = await tmdb.tvEpisodes.getChanges('9569', startDate: '2015-10-21');
  ///
  ///     // Get results until October 21st, 2015
  ///     Map result = await tmdb.tvEpisodes.getChanges('9569', endDate: '2015-10-21');
  Future<Map> getChanges(String id, {String startDate, String endDate}) {
    _Params params = new _Params();
    _checkNotNull(id, 'id');
    params['start_date'] = startDate;
    params['end_date'] = endDate;
    return _core._query('tv/episode/$id/changes', params: params);
  }

  /// This method lets users get the status of whether or not the TV episode has been rated.
  ///
  /// A valid session id is required.
  ///
  ///     // Usage
  ///     Map result = await tmdb.tvEpisodes.getAccountStates('4745', 1, 5);
  Future<Map> getAccountStates(
      String showId, int seasonNumber, int episodeNumber) {
    _Params params = new _Params.withSession();
    _checkNotNull(showId, 'showId');
    _checkNotNull(seasonNumber, 'seasonNumber');
    _checkNotNull(episodeNumber, 'episodeNumber');
    return _core._query(
        'tv/$showId/season/$seasonNumber/episode/$episodeNumber/account_states',
        params: params);
  }

  /// Get the TV episode credits by combination of season and episode number.
  ///
  ///     // Usage
  ///     Map result = await tmdb.tvEpisodes.getCredits('4745', 1, 5);
  Future<Map> getCredits(String showId, int seasonNumber, int episodeNumber) {
    _checkNotNull(showId, 'showId');
    _checkNotNull(seasonNumber, 'seasonNumber');
    _checkNotNull(episodeNumber, 'episodeNumber');
    return _core._query(
        'tv/$showId/season/$seasonNumber/episode/$episodeNumber/credits');
  }

  /// Get the external ids for a TV episode by comabination of a season and episode number.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tvEpisodes.getExternalIds('4745', 1, 5);
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.tvEpisodes.getExternalIds('4745', 2, 1, language: 'es');
  Future<Map> getExternalIds(String showId, int seasonNumber, int episodeNumber,
      {String language}) {
    _Params params = new _Params();
    _checkNotNull(showId, 'showId');
    _checkNotNull(seasonNumber, 'seasonNumber');
    _checkNotNull(episodeNumber, 'episodeNumber');
    params['language'] = language;
    return _core._query(
        'tv/$showId/season/$seasonNumber/episode/$episodeNumber/external_ids',
        params: params);
  }

  /// Get the images (episode stills) for a TV episode by combination of a season and episode number.
  ///
  /// Since episode stills don't have a language, this call will always return all images.
  ///
  ///     // Usage
  ///     Map result = await tmdb.tvEpisodes.getImages('4745', 1, 5);
  Future<Map> getImages(String showId, int seasonNumber, int episodeNumber) {
    _checkNotNull(showId, 'showId');
    _checkNotNull(seasonNumber, 'seasonNumber');
    _checkNotNull(episodeNumber, 'episodeNumber');
    return _core._query(
        'tv/$showId/season/$seasonNumber/episode/$episodeNumber/images');
  }

  /// This method lets users create a rating on a TV episode.
  ///
  /// A valid session id is required.
  ///
  ///     // Usage
  ///     Map result = await tmdb.tvEpisodes.setRating('4745', 1, 5, 7.5);
  Future<Map> setRating(
      String showId, int seasonNumber, int episodeNumber, num value) {
    _Params params = new _Params.withEitherSession();
    _checkNotNull(showId, 'showId');
    _checkNotNull(seasonNumber, 'seasonNumber');
    _checkNotNull(episodeNumber, 'episodeNumber');
    _checkNotNull(value, 'value');
    params['value'] = value;
    return _core._query(
        'tv/$showId/season/$seasonNumber/episode/$episodeNumber/rating',
        params: params,
        method: 'POST');
  }

  /// This method lets users remove a rating on a TV episode.
  ///
  /// A valid session id is required.
  ///
  ///     // Usage
  ///     Map result = await tmdb.tvEpisodes.removeRating('4745', 1, 5);
  Future<Map> removeRating(String showId, int seasonNumber, int episodeNumber) {
    _Params params = new _Params.withEitherSession();
    _checkNotNull(showId, 'showId');
    _checkNotNull(seasonNumber, 'seasonNumber');
    _checkNotNull(episodeNumber, 'episodeNumber');
    return _core._query(
        'tv/$showId/season/$seasonNumber/episode/$episodeNumber/rating',
        params: params,
        method: 'DELETE');
  }

  /// Get the external ids that we have stored for a TV season by season number.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.tvEpisodes.getVideos('4745', 1, 5);
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.tvEpisodes.getVideos('4745', 2, 1, language: 'es');
  Future<Map> getVideos(String showId, int seasonNumber, int episodeNumber,
      {String language}) {
    _Params params = new _Params();
    _checkNotNull(showId, 'showId');
    _checkNotNull(seasonNumber, 'seasonNumber');
    _checkNotNull(episodeNumber, 'episodeNumber');
    params['language'] = language;
    return _core._query(
        'tv/$showId/season/$seasonNumber/episode/$episodeNumber/videos',
        params: params);
  }
}
