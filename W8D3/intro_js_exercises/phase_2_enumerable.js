Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    };
};

Array.prototype.myMap = function(callback) {
    let mapped = [];
    // let mappingCallback = el => mapped.push(callback(el));
    let mappingCallback = function(el) { // <- this is the closure!!!
        mapped.push(callback(el)); // callback function, is not passed directly into mappingCallback
    }
    this.myEach(mappingCallback);
    return mapped;
};

Array.prototype.myReduce = function(callback, initialValue = 0) {
    let reduced = initialValue ;

    let inject = function (el) { 
        reduced = callback(reduced, el);
    }
    this.myEach(inject);

    return reduced;
}
