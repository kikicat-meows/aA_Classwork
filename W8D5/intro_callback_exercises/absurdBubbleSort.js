const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const askIfGreaterThan = (el1, el2, callback) => {
  reader.question(`Is ${el1} greater than ${el2}? Y/N`, (answer) => {
    const response = answer.toLowerCase();

    response === 'y' ? callback(true) : callback(false);
  });
};


function innerBubbleSortLoop(arr, i, madeAnySwaps, func) {
  if (i == arr.length - 1) {
    func(madeAnySwaps);
  } else {
    askIfGreaterThan(arr[i], arr[i + 1], function(value) {
      if (value) {
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
        madeAnySwaps = true;
      } else {
        madeAnySwaps = false;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, func);
    });
  }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, i = 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  outerBubbleSortLoop(true);
  // Kick the first outer loop off, starting `madeAnySwaps` as true.
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});