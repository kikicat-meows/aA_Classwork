function range(start,end) {
    if (start === end) {
        return [end];
    };

    return [start].concat(range(start+1, end));
}

function sumRec(arr) {
    if (arr.length === 0) {
        return 0;
    };

    let sum = arr.shift() + sumRec(arr)
    return sum;
}

function exponent(base,exp) {
    // if (exp === 0) {
    //     return 1;
    // };
    // let product = base * exponent(base, exp-1)
    // return product;

    if (exp === 0) {
        return 1;
    } else if (exp === 1) {
        return base;
    };

    let product = 1;

    if (exp % 2 === 0) {
        product = exponent(base, exp / 2) ** 2
    } else {
        product = base * (exponent(base, (exp - 1) / 2) ** 2)
    };

    return product;
};

function fibonacci(n) {
    if (n <= 2) {
        return [1, 1].slice(0, n);
    }; 

    let prev = fibonacci(n-1)
    let sum = prev[prev.length - 1] + prev[prev.length - 2]
    return prev.concat([sum]);
}

// 1, 1, 2, 3, 5, 8, 13, 21, 34....

function deepDup(arr) {
    if (!Array.isArray(arr)) {
        return [arr];
    };

    let dupedArr = [];

    for (let i = 0; i < arr.length; i++) {
        let ele = arr[i];
        
        dupedArr.push(...deepDup(ele));
        // if (Array.isArray(ele)) {
        //     dupedArr.push(...deepDup(ele));
        // } else {
        //     dupedArr.push(ele);
        // };
    };

    return dupedArr;
};

function bsearch(arr,target) {
    if (arr.length < 1) {
        return -1;
    };

    let midIdx = Math.floor(arr.length / 2);
    let leftArr = arr.slice(0, midIdx);
    let rightArr = arr.slice(midIdx + 1, arr.length);

    if (arr[midIdx] === target) {
        return midIdx;
    } else if (arr[midIdx] > target) {
        return bsearch(leftArr, target);
    } else {
        let rightSearch = bsearch(rightArr, target);
        if (rightSearch != -1) {
            return midIdx + 1 + rightSearch;
        } else {
            return -1;
        };
    };
}

function mergesort(arr) {
    if (arr.length === 1) {
        return arr;
    }

    let midIdx = Math.floor(arr.length / 2);
    let left = mergesort(arr.slice(0, midIdx));
    let right = mergesort(arr.slice(midIdx, arr.length));

    return merge(left, right);
};

function merge(arr1, arr2) {
    let mergedArr = [];

    while (arr1.length != 0 && arr2.length != 0) {
        if (arr1[0] < arr2[0]) {
            mergedArr.push(arr1.shift());
        } else {
            mergedArr.push(arr2.shift());
        };
    };

    return mergedArr.concat(arr1,arr2);
};

function subsets(arr) {
    if (arr.length <= 1) {
        return arr;
    };

    let subs = subsets(arr.slice(0, arr.length - 1))

    subs.concat()



}

