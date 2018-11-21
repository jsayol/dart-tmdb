// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Authentication' API calls
class Authentication {
  final TMDBApiCore _core;

  String _sessionId;
  String _guestSessionId;

  /// The session ID obtained by the [login] method.
  String get sessionId => _sessionId;

  /// The guest session ID obtained by the [newGuestSession] method.
  String get guestSessionId => _guestSessionId;

  void set sessionId(String id) { _sessionId = id; }
  void set guestSessionId(String id) { _guestSessionId = id; }

  Authentication(this._core);

  /// This method is used to generate a valid request token for user based authentication.
  ///
  /// A request token is required in order to request a session id. You can read more about this process [here](https://www.themoviedb.org/documentation/api/sessions).
  /// You can generate any number of request tokens but they will expire after 60 minutes. As soon as a valid session id has been created the token will be destroyed.
  ///
  ///     // Usage
  ///     String token = await tmdb.authentication.newToken();
  Future<String> newToken() async {
    Map resp = await _core._query('authentication/token/new', https: true);
    if ((resp != null) && resp['success']) {
      return resp['request_token'];
    } else {
      String msg = "Couldn't obtain new token" +
          ((resp?.containsKey('status_message') ?? false)
              ? ': ' + resp['status_message']
              : '');
      throw new Exception(msg);
    }
  }

  /// Once you have a valid request token you can use this method to authenticate a user with a TMDb username and password.
  ///
  /// The user must have a verified email address and be registered on TMDb. As soon as the request token has been verified and attached to a user, the request token will be invalidated.
  ///
  ///     // Usage
  ///     String token = await tmdb.authentication
  ///         .validateWithLogin('TOKEN_HERE', 'USERNAME_HERE', 'PASSWORD_HERE');
  Future<String> validateWithLogin(
      String token, String username, String password) async {
    _Params params = new _Params();
    _checkNotNull(token, 'token');
    _checkNotNull(username, 'username');
    _checkNotNull(password, 'password');
    params['token'] = token;
    params['username'] = username;
    params['password'] = password;
    Map resp = await _core._query('authentication/token/validate_with_login',
        https: true);
    if ((resp != null) && resp['success']) {
      return resp['request_token'];
    } else {
      String msg = "Couldn't authenticate user '$username'" +
          ((resp?.containsKey('status_message') ?? false)
              ? ': ' + resp['status_message']
              : '');
      throw new Exception(msg);
    }
  }

  /// This method is used to generate a session id for user based authentication.
  ///
  /// A session id is required in order to use any of the write methods.
  ///
  ///     // Usage
  ///     String sessionId = await tmdb.authentication.newSession('TOKEN_HERE');
  Future<String> newSession(String token) async {
    _Params params = new _Params();
    _checkNotNull(token, 'token');
    params['token'] = token;
    Map resp = await _core._query('authentication/session/new', https: true);
    if ((resp != null) && resp['success']) {
      return resp['session_id'];
    } else {
      String msg = "Couldn't obtain new session ID" +
          ((resp?.containsKey('status_message') ?? false)
              ? ': ' + resp['status_message']
              : '');
      throw new Exception(msg);
    }
  }

  /// This method is used to generate a guest session id.
  ///
  /// A guest session can be used to rate movies without having a registered TMDb user account. You should only generate a single guest session per user (or device) as you will be able to attach the ratings to a TMDb user account in the future. There is also IP limits in place so you should always make sure it's the end user doing the guest session actions.
  /// If a guest session is not used for the first time within 24 hours, it will be automatically discarded.
  ///
  ///     // Usage
  ///     String token = await tmdb.authentication.newToken();
  Future<String> newGuestSession() async {
    Map resp =
        await _core._query('authentication/guest_session/new', https: true);
    if ((resp != null) && resp['success']) {
      _guestSessionId = resp['guest_session_id'];
      return _guestSessionId;
    } else {
      String msg = "Couldn't obtain new guest session ID" +
          ((resp?.containsKey('status_message') ?? false)
              ? ': ' + resp['status_message']
              : '');
      throw new Exception(msg);
    }
  }

  /// Convenience method to authenticate a user via username and password.
  ///
  /// On success, the newly obtained session id is stored internally and automatically provided to any of the methods that require authentication.
  ///
  ///     // Authenticate
  ///     await tmdb.authentication.login('USERNAME_HERE', 'PASSWORD_HERE');
  ///
  ///     // Now you can call any method that requires authentication. No need to provide a session id.
  ///     Map userInfo = await tmdb.account.getInfo();
  Future<bool> login(String username, String password) async {
    String token = await newToken();
    _sessionId = await newSession(await validateWithLogin(token, username, password));
    return true;
  }

  /// Convenience method to obtain a URL to authenticate a user via the browser.
  ///
  /// With [redirectTo] you can specify the URL you would like the user to be redirected to once authentication has finished.
  ///
  ///     // Basic usage
  ///     String url = tmdb.authentication.getUrl('TOKEN_HERE');
  ///
  ///     // Redirect the user to a specific website after authentication
  ///     String url = tmdb.authentication.getUrl('TOKEN_HERE',
  ///         redirectTo: 'http://www.google.com');
  ///
  ///     // Obtain URL with new token
  ///     String url = tmdb.authentication.getUrl(await tmdb.authentication.newToken());
  String getUrl(String token, {String redirectTo}) {
    String url = 'https://www.themoviedb.org/authenticate/$token';
    if (redirectTo != null) {
      url += '?redirect_to=' + Uri.encodeQueryComponent(redirectTo);
    }
    return url;
  }
}
