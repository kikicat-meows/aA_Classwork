Array.prototype.bubbleSort = function() {
    let sorted = false

    while (!sorted) {
        sorted = true

        for (let i = 0; i < this.length - 1; i++) {
            let [first, second] = [this[i], this[i+1]];

            if (first > second) {
                [this[i],this[i+1]] = [second, first];
                sorted = false;
            };
        };
    };

    return this;
};

unsortedArr = [3,2,5,7,1,4]

String.prototype.substrings = function() {
    let subs = [];

    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j < this.length; j++) {
            subs.push(this.slice(i, j));
        };
    };

    return subs;
};
