var readline = require('readline');

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfLessThan(el1, el2, callback) {
  reader.question("Is " + el1 + " less than " + el2 + " ?", function (response) {
    if (response === "y") {
      callback(true);
    } else {
      callback(false);
    }
  });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1){
    askIfLessThan(arr[i], arr[i + 1], function (isLessThan) {
      if (isLessThan === false){
        var temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  } else {
    outerBubbleSortLoop(madeAnySwaps);
  }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps === true) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  
  outerBubbleSortLoop(true);
}

absurdBubbleSort([2, 3, 1, 4], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});