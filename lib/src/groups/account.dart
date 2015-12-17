// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Account' API calls
class Account {
  final TMDBApiCore _core;

  Account(this._core);

  /// Get the basic information for the authenticated account.
  ///
  /// You will need to have a valid session id.
  ///
  ///     // Usage
  ///     Map result = await tmdb.account.getInfo();
  Future<Map> getInfo() {
    Params params = new Params.withSessionId(_core);
    return _core._query('account', params: params);
  }

  /// Get the lists that you have created and marked as a favorite.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.account.getLists();
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.account.getLists(language: 'es');
  ///
  ///     // Get second page of results
  ///     Map result = await tmdb.account.getLists(page: 2);
  Future<Map> getLists({int page, String language}) {
    Params params = new Params.withSessionId(_core);
    params.add('page', page);
    params.add('language', language);
    return _core._query('account/0/lists', params: params);
  }

  /// Get the list of favorite movies for the authenticated account.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.account.getFavoriteMovies();
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.account.getFavoriteMovies(language: 'es');
  ///
  ///     // Get second page of results, sorted by creation date
  ///     Map result = await tmdb.account.getFavoriteMovies(page: 2, sortBy: 'created_at.asc');
  Future<Map> getFavoriteMovies({int page, String language, String sortBy}) {
    Params params = new Params.withSessionId(_core);
    params.add('page', page);
    params.add('language', language);
    params.add('sort_by', sortBy);
    return _core._query('account/0/favorite/movies', params: params);
  }

  /// Get the list of favorite TV series for the authenticated account.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.account.getFavoriteTv();
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.account.getFavoriteTv(language: 'es');
  ///
  ///     // Get second page of results, sorted by creation date
  ///     Map result = await tmdb.account.getFavoriteTv(page: 2, sortBy: 'created_at.asc');
  Future<Map> getFavoriteTv({int page, String language, String sortBy}) {
    Params params = new Params.withSessionId(_core);
    params.add('page', page);
    params.add('language', language);
    params.add('sort_by', sortBy);
    return _core._query('account/0/favorite/tv', params: params);
  }

  // Internal method to set/remove a favorite or watchlist
  Future<Map> _setList(String id, String type, String option, bool add) {
    Params params = new Params.withSessionId(_core);
    params.add('media_id', id);
    params.add('media_type', type);
    params.add(option, add);
    return _core._query('account/0/$option', method: 'POST', params: params);
  }

  /// Add or remove a movie to the authenticated account's favorite list.
  ///
  ///     // Add favorite
  ///     Map result = await tmdb.account.setFavoriteMovie('105');
  ///     // Or
  ///     Map result = await tmdb.account.setFavoriteMovie('105', favorite: true);
  ///
  ///     // Remove favorite
  ///     Map result = await tmdb.account.setFavoriteMovie('105', favorite: false);
  Future<Map> setFavoriteMovie(String id, {bool favorite: true}) {
    return _setList(id, 'movie', 'favorite', favorite);
  }

  /// Add or remove a TV series to the authenticated account's favorite list.
  ///
  ///     // Add favorite
  ///     Map result = await tmdb.account.setFavoriteTv('4745');
  ///     // Or
  ///     Map result = await tmdb.account.setFavoriteTv('4745', favorite: true);
  ///
  ///     // Remove favorite
  ///     Map result = await tmdb.account.setFavoriteTv('4745', favorite: false);
  Future<Map> setFavoriteTv(String id, {bool favorite: true}) {
    return _setList(id, 'tv', 'favorite', favorite);
  }

  /// Add or remove a movie to the authenticated account's watchlist.
  ///
  ///     // Add favorite
  ///     Map result = await tmdb.account.setWatchlistMovie('105');
  ///     // Or
  ///     Map result = await tmdb.account.setWatchlistMovie('105', watchlist: true);
  ///
  ///     // Remove favorite
  ///     Map result = await tmdb.account.setWatchlistMovie('105', watchlist: false);
  Future<Map> setWatchlistMovie(String id, {bool watchlist: true}) {
    return _setList(id, 'movie', 'watchlist', watchlist);
  }

  /// Add or remove a TV series to the authenticated account's watchlist.
  ///
  ///     // Add favorite
  ///     Map result = await tmdb.account.setWatchlistTv('4745');
  ///     // Or
  ///     Map result = await tmdb.account.setWatchlistTv('4745', watchlist: true);
  ///
  ///     // Remove favorite
  ///     Map result = await tmdb.account.setWatchlistTv('4745', watchlist: false);
  Future<Map> setWatchlistTv(String id, {bool watchlist: true}) {
    return _setList(id, 'tv', 'watchlist', watchlist);
  }

  // Internal method to get various movies/tv lists (rated, watchlist)
  Future<Map> _getList(
      String id, String type, int page, String language, String sortBy) {
    Params params = new Params.withSessionId(_core);
    params.add('page', page);
    params.add('language', language);
    params.add('sort_by', sortBy);
    return _core._query('account/0/$type', params: params);
  }

  /// Get the list of rated movies (and associated rating) for the authenticated account.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.account.getRatedMovies();
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.account.getRatedMovies(language: 'es');
  ///
  ///     // Get second page of results, sorted by creation date
  ///     Map result = await tmdb.account.getRatedMovies(page: 2, sortBy: 'created_at.asc');
  Future<Map> getRatedMovies(String id,
      {int page, String language, String sortBy}) {
    return _getList(id, 'rated/movies', page, language, sortBy);
  }

  /// Get the list of rated TV shows (and associated rating) for the authenticated account.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.account.getRatedMovies();
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.account.getRatedMovies(language: 'es');
  ///
  ///     // Get second page of results, sorted by creation date
  ///     Map result = await tmdb.account.getRatedMovies(page: 2, sortBy: 'created_at.asc');
  Future<Map> getRatedTv(String id,
      {int page, String language, String sortBy}) {
    return _getList(id, 'rated/tv', page, language, sortBy);
  }

  /// Get the list of rated TV episodes (and associated rating) for the authenticated account.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.account.getRatedMovies();
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.account.getRatedMovies(language: 'es');
  ///
  ///     // Get second page of results, sorted by creation date
  ///     Map result = await tmdb.account.getRatedMovies(page: 2, sortBy: 'created_at.asc');
  Future<Map> getRatedTvEpisodes(String id,
      {int page, String language, String sortBy}) {
    return _getList(id, 'rated/tv/episodes', page, language, sortBy);
  }

  /// Get the list of movies on an accounts watchlist.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.account.getWatchlistMovies();
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.account.getWatchlistMovies(language: 'es');
  ///
  ///     // Get second page of results, sorted by creation date
  ///     Map result = await tmdb.account.getWatchlistMovies(page: 2, sortBy: 'created_at.asc');
  Future<Map> getWatchlistMovies(String id,
      {int page, String language, String sortBy}) {
    return _getList(id, 'watchlist/movies', page, language, sortBy);
  }

  /// Get the list of TV shows on an accounts watchlist.
  ///
  ///     // Basic usage
  ///     Map result = await tmdb.account.getWatchlistTv();
  ///
  ///     // Get results in Spanish
  ///     Map result = await tmdb.account.getWatchlistTv(language: 'es');
  ///
  ///     // Get second page of results, sorted by creation date
  ///     Map result = await tmdb.account.getWatchlistTv(page: 2, sortBy: 'created_at.asc');
  Future<Map> getWatchlistTv(String id,
      {int page, String language, String sortBy}) {
    return _getList(id, 'watchlist/tv', page, language, sortBy);
  }
}
