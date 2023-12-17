const totalCostHelper = (totalNumberOfComicsBought, currentIteration) => {
    if (currentIteration > totalNumberOfComicsBought) {
        return 0;
    } else {
        let comicPirce = 0; //init var
        if (currentIteration >= 1 && currentIteration <= 10) {
            comicPirce = 5;
        } else if (currentIteration >= 11 && currentIteration <= 20) {
            comicPirce = 4;
        } else if (currentIteration >= 21 && currentIteration <= 30) {
            comicPirce = 3.5;
        } else {
            comicPirce = 3;
        }
        return comicPirce + totalCostHelper(totalNumberOfComicsBought, currentIteration + 1);
    }
}
const totalCost = (numberOfComicsBought) => {
    let totalCostResult = totalCostHelper(numberOfComicsBought, 1);

    if (numberOfComicsBought > 50) {
        totalCostResult -= 10;
    }
    return totalCostResult;
}

// console.log(totalCost(12));
// console.log(totalCost(37));
// console.log(totalCost(53));

const dot = (list1, list2) => {
    if (list1.length === 0 || list2.length === 0) {
        return 0;
    } else {
        return list1[0] * list2[0] + dot(list1.slice(1), list2.slice(1));
    }
}

// console.log(dot([1, 2, 3], [4, 5, 6])); // 32
// console.log(dot([1, -1, 1, -1], [2, 2, 2, 2])); // 0
// console.log(dot([1, 2, 3, 4], [5, 6, 7, 8])); // 70
// console.log(dot([], [])); // 0

function adjDiff(L) {
    if (L.length < 2) {
      return [];
    }

    const N = [];
    for (let i = 0; i < L.length - 1; i++) {
      N.push(L[i + 1] - L[i]);
    }

    return N;
  }

//   // Example usage:
//   const result1 = adjDiff([3, 8, -1, 4]);
//   console.log(result1);  // Output: [5, -9, 5]

//   const result2 = adjDiff([1, 2, 3, 4, 5]);
//   console.log(result2);  // Output: [1, 1, 1, 1]

//   const result3 = adjDiff([]);
//   console.log(result3);  // Output: []


function collatzLength(n) {
    // Check if n is a positive integer
    if (n <= 0 || !Number.isInteger(n)) {
      return "Input must be a positive integer.";
    }

    // Function to generate the Collatz sequence
    function collatzSequence(num) {
      let sequence = [num];
      while (num !== 1) {
        if (num % 2 === 0) {
          num = num / 2;
        } else {
          num = num * 3 + 1;
        }
        sequence.push(num);
      }
      return sequence;
    }

    // Generate the Collatz sequence for n
    const sequence = collatzSequence(n);

    // Return the length of the Collatz sequence minus 1
    return sequence.length - 1;
  }

//   // Example usage:
//   console.log(collatzLength(7)); // Output: 16
//   console.log(collatzLength(8)); // Output: 146
//   console.log(collatzLength(1005)); // Output: 67

function trunc(a, b, x) {
    // Use the map function to apply the truncation logic to each element in the array
    return x.map(function(xi) {
      if (xi < a) {
        return a;
      } else if (xi > b) {
        return b;
      } else {
        return xi;
      }
    });
  }

//   // Test cases
//   console.log(trunc(0, 1, [-2, -1, 0, 1, 2]));         // Output: [0, 0, 0, 1, 1]
//   console.log(trunc(0.5, 1.5, [-2, -1, 0, 1, 2]));     // Output: [0.5, 0.5, 0.5, 1, 1.5]
//   console.log(trunc(1, 1, [-2, -1, 0, 1, 2]));         // Output: [1, 1, 1, 1, 1]

function leq(list1, list2) {
    // Check if the lengths of both lists are equal
    if (list1.length !== list2.length) {
      return false;
    }

    // Use the map function to compare each pair of elements
    const comparisons = list1.map((x, i) => x <= list2[i]);

    // Use the reduce function to check if all comparisons are true
    return comparisons.reduce((acc, curr) => acc && curr, true);
  }

  // Test cases
  console.log(leq([1, 2, 3], [2, 3, 3])); // true
  console.log(leq([1, 2, 3], [3, 2, 1])); // false
  console.log(leq([1, 0], [0, 1]));       // false
  console.log(leq([], []));                // true
