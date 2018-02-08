# MediaWiktory Changelog

# 0.1.3 (2018-02-08)

* Add gzip headers, as it should be done a long ago :(

# 0.1.2 (2017-11-09)

* Fix requiring `addressable` (@chrisadams).

# 0.1.1 (2017-05-11)

* **quickfix** properly registered `mediawiktory-gen` binary;
* API definitions generated from recent Wikipedia API.

# 0.1.0 (2017-05-10)

* First mature release;
* Change of API wrapper approach and allow to generate several different API wrappers;
* Specs & docs.

# 0.0.3 (2017-03-18)

* Regenerated Wikipedia wrapper in correspondence to current API version;
* Preparing to independent wrappers concept.

# 0.0.2 (2015-12-21)

* `Page` class for grouping records in `Query::Response`;
* `User-Agent` header support;
* Enums handling changed to symbols (were strings before);
* Correct behavior on empty pagelist when using generator (@smostovoy);
* Raise on errors in response (@smostovoy);
* Access to warnings in response (@smostovoy);
* Domain redirects transparent handling,
  http://en.wikipedia.org -> https://en.wikipedia.org (@smostovoy).

# 0.0.1 (2015-11-30)

Initial!


