/* global exports */
"use strict";

// module Data.Unique

var MAX_SAFE_INTEGER = 9007199254740991;
var uniqueSource = [];

function iter(i) {
  if (uniqueSource.length === i) {
    for (var j = 0; j < i; ++j) uniqueSource[j] = 0;
    uniqueSource[i] = 1;
  } else {
    if (uniqueSource[i] === MAX_SAFE_INTEGER) {
      uniqueSource[i] = 0;
      iter(i + 1);
    } else {
      uniqueSource[i]++;
    }
  }
}

exports.newUnique = function () {
  iter(0);
  return uniqueSource.length === 1 ? uniqueSource[0] + "" : uniqueSource.join(",");
};

