# RPresto 1.3.0

- Fix Rcpp compilation under Windows (#79)
- `SET/RESET SESSION` queries are now correctly respected when used under `dbGetQuery`.
  `PrestoConnection` no longer has `parameters` slot but `dbConnect` remains backward
  compatible. Manual change to parameter is still possible via `conn@session$setParameter()` (#77)
- Adapt to changes in dplyr version 0.7.0, mainly around the remote
  backend support being split to `dbplyr`. This should be backwards compatible
  back to dplyr 0.4.3 (#76)
- Add support for the REAL data type (#70)
- Allow specifying the connection source (#68)
- Drop RCurl dependency (#67)
- Return DECIMAL data types as characters as opposed to numeric's
  previously (#64, fixes #60)
- Add support for new integer data types (INTEGER, SMALLINT, TINYINT) (#59, fixes #56)
- Migrate the  `json` to `data.frame` construction from pure R to Rcpp for 10x
  speed gains! (thanks @saurfang) (#57, #58)
- Fix dbListFields to use the nextUri instead of infoUri (#55)
- Don't drop data for duplicate column names (#53)

# RPresto 1.2.1

- Handle responses with no column information (fixes #49)
- Add retries for GET and POST responses with error status codes
- Skip test cases for ones that need locale modification if we cannot set the locale for the OS.
- Adapt to changes in the upcoming dplyr and testthat versions.

# RPresto 1.2.0

- Add a `session.timezone` parameter to `dbConnect` and `src_presto` which
  defaults to UTC.  This affects the timestamps returned for Presto data types
  "TIMESTAMP".  We handle the ambiguity by assigning a time zone to _every_
  POSIXct column returned. Note that if you are doing `as.character()` directly
  on these columns, the values you obtain will be different from what happened
  before.
- Fix the way we handle zero row multiple column query results. This will
  affect `LIMIT 0` queries specifically.

# RPresto 1.1.1

- Minor dplyr related fixes
- Drop the R version requirement from 3.1.1 to 3.1.0
- Speed-up in binding chunks if dplyr is available.
- Handle special values like Infinity, NaN.

# RPresto 1.1.0

- Add optional dplyr support. One can initiate a connection via `src_presto`.
- Minor documentation fixes.

# RPresto 1.0.0

- Initial release to github
