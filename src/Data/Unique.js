export var zero = BigInt("0");

var one = BigInt("1");

export function eqImpl(a) {
  return function(b) {
    return a === b;
  };
}

export function ordImpl(lt) {
  return function (eq) {
    return function (gt) {
      return function (x) {
        return function (y) {
          return x < y ? lt : x === y ? eq : gt;
        };
      };
    };
  };
}

export function addOne(x) {
  return x + one;
}

export function hashUnique(x) {
  return parseInt(BigInt.asIntN(32, x));
}