# tmdb

A [TheMoviedb.org][apidocs] (TMDB) library for Dart.

## Features

* Access to all API methods
* Support for both console (`dart:io`) and web (`dart:html`) applications
* User authentication, either:
  * with a username and password (obtains new session ID)
  * with a previously obtained session ID
* You need to provide your own API key

## Documentation

See the [full documentation](https://www.dartdocs.org/documentation/tmdb/latest) on *DartDocs*.

## Usage

First import the proper library for the platform.

If your code is running on the Dart VM (where you'd use `dart:io`) then:
```dart
import 'package:tmdb/io.dart';
```
If your code runs on the browser (where you'd use `dart:html`) then:
```dart
import 'package:tmdb/html.dart';
```

With the library imported you can just create a new instance (providing your API key) and access all of its methods.

For example, a simple console application to get the top rated movies would look like this:
```dart
// Import the proper library
import 'package:tmdb/io.dart';

main() async {
  // Create a new TMDBApi instance
  TMDBApi tmdb = new TMDBApi('YOUR_API_KEY_HERE');

  // Get the top rated movies
  Map topRated = await tmdb.movies.getTopRated();

  // Loop through the results and print the title, year, and rating
  topRated['results'].forEach((v) {
    var title = v['title'];
    var year = DateTime.parse(v['release_date']).year;
    var rating = v['vote_average'].toStringAsFixed(1);
    print("$title ($year) * $rating/10");
  });
}
```

## Authentication

If you already have a valid session ID for the user, you can just feed it to the library and start using any method that requires authentication:
```dart
// Create instance
TMDBApi tmdb = new TMDBApi('YOUR_API_KEY_HERE');

// Set the session ID
tmdb.authentication.sessionId = 'SESSION_ID_HERE';

// Get the user's information
var info = await tmdb.account.getInfo();

```

If you don't have a session ID for the user you want to authenticate you can easily obtain one using the `login` method.
```dart
// Create instance
TMDBApi tmdb = new TMDBApi('YOUR_API_KEY_HERE');

// Log in with a username and password
await tmdb.authentication.login('USERNAME_HERE', 'PASSWORD_HERE');

// The session ID is now stored in tmdb.authentication.sessionId
// so you can start using any API method.
// SAVE THE SESSION ID FOR FUTURE USE.

// Get the user's information
var info = await tmdb.account.getInfo();

```

**IMPORTANT: You should only use the `login` method once for each user because the API will generate a new session ID every time you do so. Once you have obtained it you should save it somewhere safe and feed it to the library whenever you need to (which is usually right after calling `new TMDBApi()`).**

## Futures vs async/await

The easiest way to call the API methods is using the [async/await ][async] syntax provided by Dart, like on the examples above.

To use it you just need to add the `async` modifier to the function that will be calling the asynchronous methods from this library. Then, prefix the actual call with `await`.
```dart
printMovieInfo(id) async {
  var info = await tmdb.movies.getInfo(id);
  print(info);
}
```
Or even
```dart
printMovieInfo(id) async {
  print(await tmdb.movies.getInfo(id));
}
```

If for any reason you can't or don't want to use async/await, you can just use the [Futures][future] directly:
```dart
printMovieInfo(id) {
  tmdb.movies.getInfo(id).then((info) {
    print(info);
  });
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[apidocs]: http://docs.themoviedb.apiary.io/
[async]: https://www.dartlang.org/articles/await-async/
[future]: https://api.dartlang.org/1.13.1/dart-async/Future-class.html
[tracker]: https://github.com/jsayol/dart-tmdb/issues
