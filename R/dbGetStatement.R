# Copyright (c) Meta Platforms, Inc. and affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

#' @include PrestoResult.R
NULL

.dbGetStatement <- function(res, ...) {
  return(res@statement)
}

#' @rdname PrestoResult-class
#' @importMethodsFrom DBI dbGetStatement
#' @export
setMethod("dbGetStatement", "PrestoResult", .dbGetStatement)
