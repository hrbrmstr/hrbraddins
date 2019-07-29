
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/hrbraddins.svg?branch=master)](https://travis-ci.org/hrbrmstr/hrbraddins)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/hrbraddins/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/hrbraddins)
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.2.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# hrbraddins

Moar Addins for RStudio

## Description

Experiments, mostly. *Please* take the code and use it\! This package
will NEVER see CRAN. I don’t even need credit. If you find something
useful and are willing to round out the corners, it’s all yours.

## What’s in the tin?

The following functions are implemented:

  - `bare_combine`: Turn a selection of comma-separated bare strings
    into a base::combine statement
  - `bare_space_combine`: Turn a selection of space-separated bare
    strings into a base::combine statement
  - `check_package_urls`: Check package URLs
  - `cleanAndGo`: Clean the environment and run the active script
  - `enslave`: Run a selection as an RStudio background job
  - `join_rows`: Join cr/lf-separated selected rows of text into a
    single space-separated row
  - `rantAddin`: Make it easier to annoy followers and reinforce one’s
    entitlement.
  - `refresh_renviron`: Refreshes in-memory environment variables (if it
    exists)
  - `run_tiny_test`: Run tinytest on a package
  - `tweet_share`: Share the active RStudio source tab on Twitter
  - `zapGremlins`: Find R source files with non-ASCII characters

### Installation

``` r
install.packages("hrbraddins", repos = "https://cinc.rud.is")
# or
remotes::install_git("https://git.rud.is/hrbrmstr/hrbraddins.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/hrbraddins")
# or
remotes::install_gitlab("hrbrmstr/hrbraddins")
# or
remotes::install_bitbucket("hrbrmstr/hrbraddins")
# or
remotes::install_github("hrbrmstr/hrbraddins")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## hrbraddins Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines | (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | --: |
| R    |       15 | 0.94 | 212 | 0.98 |          97 | 0.87 |       95 | 0.8 |
| Rmd  |        1 | 0.06 |   5 | 0.02 |          15 | 0.13 |       24 | 0.2 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
