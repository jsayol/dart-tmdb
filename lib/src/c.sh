#!/bin/sh

mkdir -p class

sed 's/_CLASSNAME_/configuration/g' _template_.dart | sed 's/configuration/\u&/g' | sed 's/_CLASSNAMELC_/configuration/g' > class/configuration.dart

sed 's/_CLASSNAME_/account/g' _template_.dart | sed 's/account/\u&/g' | sed 's/_CLASSNAMELC_/account/g' > class/account.dart

sed 's/_CLASSNAME_/authentication/g' _template_.dart | sed 's/authentication/\u&/g' | sed 's/_CLASSNAMELC_/authentication/g' > class/authentication.dart

sed 's/_CLASSNAME_/certifications/g' _template_.dart | sed 's/certifications/\u&/g' | sed 's/_CLASSNAMELC_/certifications/g' > class/certifications.dart

sed 's/_CLASSNAME_/changes/g' _template_.dart | sed 's/changes/\u&/g' | sed 's/_CLASSNAMELC_/changes/g' > class/changes.dart

sed 's/_CLASSNAME_/collections/g' _template_.dart | sed 's/collections/\u&/g' | sed 's/_CLASSNAMELC_/collections/g' > class/collections.dart

sed 's/_CLASSNAME_/companies/g' _template_.dart | sed 's/companies/\u&/g' | sed 's/_CLASSNAMELC_/companies/g' > class/companies.dart

sed 's/_CLASSNAME_/credits/g' _template_.dart | sed 's/credits/\u&/g' | sed 's/_CLASSNAMELC_/credits/g' > class/credits.dart

sed 's/_CLASSNAME_/discover/g' _template_.dart | sed 's/discover/\u&/g' | sed 's/_CLASSNAMELC_/discover/g' > class/discover.dart

sed 's/_CLASSNAME_/find/g' _template_.dart | sed 's/find/\u&/g' | sed 's/_CLASSNAMELC_/find/g' > class/find.dart

sed 's/_CLASSNAME_/genres/g' _template_.dart | sed 's/genres/\u&/g' | sed 's/_CLASSNAMELC_/genres/g' > class/genres.dart

sed 's/_CLASSNAME_/jobs/g' _template_.dart | sed 's/jobs/\u&/g' | sed 's/_CLASSNAMELC_/jobs/g' > class/jobs.dart

sed 's/_CLASSNAME_/keywords/g' _template_.dart | sed 's/keywords/\u&/g' | sed 's/_CLASSNAMELC_/keywords/g' > class/keywords.dart

sed 's/_CLASSNAME_/lists/g' _template_.dart | sed 's/lists/\u&/g' | sed 's/_CLASSNAMELC_/lists/g' > class/lists.dart

sed 's/_CLASSNAME_/movies/g' _template_.dart | sed 's/movies/\u&/g' | sed 's/_CLASSNAMELC_/movies/g' > class/movies.dart

sed 's/_CLASSNAME_/networks/g' _template_.dart | sed 's/networks/\u&/g' | sed 's/_CLASSNAMELC_/networks/g' > class/networks.dart

sed 's/_CLASSNAME_/people/g' _template_.dart | sed 's/people/\u&/g' | sed 's/_CLASSNAMELC_/people/g' > class/people.dart

sed 's/_CLASSNAME_/reviews/g' _template_.dart | sed 's/reviews/\u&/g' | sed 's/_CLASSNAMELC_/reviews/g' > class/reviews.dart

sed 's/_CLASSNAME_/search/g' _template_.dart | sed 's/search/\u&/g' | sed 's/_CLASSNAMELC_/search/g' > class/search.dart

sed 's/_CLASSNAME_/timezones/g' _template_.dart | sed 's/timezones/\u&/g' | sed 's/_CLASSNAMELC_/timezones/g' > class/timezones.dart

sed 's/_CLASSNAME_/tv/g' _template_.dart | sed 's/tv/\u&/g' | sed 's/_CLASSNAMELC_/tv/g' > class/tv.dart

sed 's/_CLASSNAME_/tvseasons/g' _template_.dart | sed 's/tvseasons/\u&/g' | sed 's/_CLASSNAMELC_/tvseasons/g' > class/tvseasons.dart

sed 's/_CLASSNAME_/tvepisodes/g' _template_.dart | sed 's/tvepisodes/\u&/g' | sed 's/_CLASSNAMELC_/tvepisodes/g' > class/tvepisodes.dart
