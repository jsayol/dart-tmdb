// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'People' API calls
class People {
  final TMDBApiCore _core;

  People(this._core);

  /// Get the general person information for a specific id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.people.getInfo('521');
  ///
  ///     // Get results plus images and TV credits
  ///     Map result = await tmdb.people.getInfo('521', append: ['images', 'tv_credits']);
  Future<Map> getCredits(String id, {List<String> append}) {
    Params params = new Params();
    _checkNotNull(id, 'id');
    params.add('append_to_response', append);
    return _core._query('person/$id', params: params);
  }

  /// Get the movie credits for a specific person id.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.people.getMovieCredits('521');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.people.getMovieCredits('521', language: 'es');
  ///
  ///     // Get results plus images and TV credits
  ///     Map result = await tmdb.people.getMovieCredits('521', append: ['images', 'tv_credits']);
  Future<Map> getMovieCredits(String id,
      {String language, List<String> append}) {
    Params params = new Params();
    _checkNotNull(id, 'id');
    params.add('language', language);
    params.add('append_to_response', append);
    return _core._query('person/$id/movie_credits', params: params);
  }

  /// Get the TV credits for a specific person id.
  ///
  /// To get the expanded details for each record, call the /credit method with the provided credit_id. This will provide details about which episode and/or season the credit is for.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.people.getTvCredits('521');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.people.getTvCredits('521', language: 'es');
  ///
  ///     // Get results plus images and movie credits
  ///     Map result = await tmdb.people.getTvCredits('521', append: ['images', 'movie_credits']);
  Future<Map> getTvCredits(String id, {String language, List<String> append}) {
    Params params = new Params();
    _checkNotNull(id, 'id');
    params.add('language', language);
    params.add('append_to_response', append);
    return _core._query('person/$id/tv_credits', params: params);
  }

  /// Get the combined (movie and TV) credits for a specific person id.
  ///
  /// To get the expanded details for each TV record, call the /credit method with the provided credit_id. This will provide details about which episode and/or season the credit is for.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.people.getCombinedCredits('521');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.people.getCombinedCredits('521', language: 'es');
  ///
  ///     // Get results plus images
  ///     Map result = await tmdb.people.getCombinedCredits('521', append: ['images']);
  Future<Map> getCombinedCredits(String id,
      {String language, List<String> append}) {
    Params params = new Params();
    _checkNotNull(id, 'id');
    params.add('language', language);
    params.add('append_to_response', append);
    return _core._query('person/$id/combined_credits', params: params);
  }

  /// Get the external ids for a specific person id.
  ///
  ///     // Usage
  ///     Map result = await tmdb.people.getExternalIds('521');
  Future<Map> getExternalIds(String id) {
    _checkNotNull(id, 'id');
    return _core._query('person/$id/external_ids');
  }

  /// Get the images for a specific person id.
  ///
  ///     // Usage
  ///     Map result = await tmdb.people.getImages('521');
  Future<Map> getImages(String id) {
    _checkNotNull(id, 'id');
    return _core._query('person/$id/images');
  }

  /// Get the images that have been tagged with a specific person id.
  ///
  /// All of the image results are returned by the API with a `media` object mapped for each image.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.people.getTaggedImages('521');
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.people.getTaggedImages('521', language: 'es');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.people.getTaggedImages('521', page: 2);
  Future<Map> getTaggedImages(String id, {int page, String language}) {
    Params params = new Params();
    _checkNotNull(id, 'id');
    params.add('page', page);
    params.add('language', language);
    return _core._query('person/$id/tagged_images', params: params);
  }

  /// Get the changes for a specific person id.
  ///
  /// Changes are grouped by key, and ordered by date in descending order. By default, only the last 24 hours of changes are returned. The maximum number of days that can be returned in a single request is 14. The language is present on fields that are translatable.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.people.getChanges('521');
  ///
  ///     // Get results starting from October 21st, 2015
  ///     Map result = await tmdb.people.getChanges('521', startDate: '2015-10-21');
  Future<Map> getChanges(String id, {String startDate, String endDate}) {
    Params params = new Params();
    _checkNotNull(id, 'id');
    params.add('start_date', startDate);
    params.add('end_date', endDate);
    return _core._query('person/$id/changes', params: params);
  }

  /// Get the list of popular people on The Movie Database.
  ///
  /// This list refreshes every day.
  ///
  ///     // Usage
  ///     Map result = await tmdb.people.getPopular();
  Future<Map> getPopular({int page}) {
    Params params = new Params();
    params.add('page', page);
    return _core._query('person/popular', params: params);
  }

  /// Get the latest person id.
  ///
  ///     // Usage
  ///     Map result = await tmdb.people.getLatest();
  Future<Map> getLatest() {
    return _core._query('person/latest');
  }
}
