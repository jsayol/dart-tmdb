// Copyright (c) 2015, Josep Sayol. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of tmdb.core;

/// Handles the 'Configuration' API calls
class Configuration {
  final TMDBApiCore _core;

  Configuration(this._core);

  /// Get the system-wide configuration information.
  ///
  /// Some elements of the API require some knowledge of this configuration data. The purpose of this is to try and keep the actual API responses as light as possible. It is recommended you cache this data within your application and check for updates every few days.
  /// This method currently holds the data relevant to building image URLs as well as the change key map.
  /// To build an image URL, you will need 3 pieces of data. The `base_url`, `size` and `file_path`. Simply combine them all and you will have a fully qualified URL. Here’s an example URL:
  /// `http://image.tmdb.org/t/p/w500/x4N74cycZvKu5k3KDERJay4ajR3.jpg`
  ///
  ///     // Usage
  ///     Map result = await tmdb.configuration.get();
  Future<Map> get() {
    return _core._query('configuration');
  }
}
