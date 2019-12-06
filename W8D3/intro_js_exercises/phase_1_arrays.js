Array.prototype.uniq = function(){
    let uniqueArr = [];

    for (let i = 0; i < this.length; i++) {
        if (uniqueArr.indexOf(this[i]) === -1) {
            uniqueArr.push(this[i]);
        };
    };

    return uniqueArr;
}

arr1 = [1, 1, 2, 3, 3, 4, 5, 5]

Array.prototype.twoSum = function() {
    let sumArray = [];

    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                sumArray.push([i,j]);
            };
        };
    };

    return sumArray;
}

arr2 = [-2, 2, 1, -5, 3, 4, -4, -3]


Array.prototype.transpose = function() {
    let transposedArr = [];

    for (let i = 0; i < this.length; i++) {
        let subArr = [];

        for (let j = 0; j < this.length; j++) {
            subArr.push(this[j][i]);
        };

        transposedArr.push(subArr);
    };

    return transposedArr
};

arr3 = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]