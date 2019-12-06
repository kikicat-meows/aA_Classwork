
// Array#myEach(callback) - receives a callback function and executes the callback for each element in the array

Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};


Array.prototype.myMap = function(callback) {
  let mapped = [];
  this.myEach( (ele) => mapped.push(callback(ele)));
  return mapped;
};

// Array#myReduce(callback[, initialValue]) - (like Ruby's Array#inject) receives a callback function, and optional initial value, returns an accumulator by applying the callback function to each element and the result of the last invocation of the callback (or initial value if supplied)

// initialValue is optional and should default to the first element of the array if not provided

// Array.prototype.myReduce = function(callback, initialValue = 0) {
//   // let inject = function(el) {
//   //   initialValue = callback(initialValue, el);
//   // }

//   this.myEach( (el) => initialValue = callback(initialValue, el) );

//   return initialValue;
// }

Array.prototype.myReduce = function (callback, initialValue) {
  let arr = this;

  if (initialValue === undefined) {
    initialValue = arr[0];
    arr = arr.slice(1);
  }

  let result = initialValue;

  arr.myEach(el => result = func(result, el));

  return result;
};

console.log(NUMS.myReduce( (total, item) => total + item )); 