// sum

function sum() {
    let total = 0;
    for (let i = 0; i < arguments.length; i++) {
        total += arguments[i];
    }
    return total;
};

function sum2(...args) {
    let total = 0;
    for (let i = 0; i < args.length; i++) {
        total += args[i];
    }
    return total;
}

console.log(sum(1, 2, 3, 4) === 10);
console.log(sum(1, 2, 3, 4, 5) === 15);

console.log(sum2(1, 2, 3, 4) === 10);
console.log(sum2(1, 2, 3, 4, 5) === 15);


// myBind

Function.prototype.myBind = function(context) {
    const newFunc = this;
    const bindArgs = Array.from(arguments).slice(1); // removing the context (which is already defined)
    return function() {
        const callArgs = Array.from(arguments); // any additional arguments passed in after binding context
        this.apply(context, bindArgs.concat(callArgs));
    };
};

// version showed by Helen on Friday
Function.prototype.myBind2 = function (context, ...bArgs) {
    // return a function that returns something that invokes the context;

    return (...cArgs) => {
        // console.log(context);
        this.apply(context, bArgs.concat(cArgs));
    };
};

// currying

function curriedSum(argCount) {
    const nums = [];

    function _curriedSum(num) {
        nums.push(num);
        if (nums.length === argCount) {
            let total = 0;

            for (let i = 0; i < nums.length; i++) {
                total = total + nums[i];
            }

            return total;
        } else {
            return _curriedSum; 
            // like a recursive call on the function to keep receiving args until condition becomes true
        }
    }

    return _curriedSum;
};

const test = curriedSum(4);
console.log(test(5)(30)(20)(1));


// curry

Function.prototype.curry = function(numArgs) {
    count args = [];
    count thisFunc = this;

    // if we use arrow syntax for _curry (ie const _curry = (arg) => {})
    function _curry(arg) {
        args.push(arg);

        if (args.length === numArgs) {
            return thisFunc(...args);
        } else {
            return _curry;
        }
    }

    return _curry;
};



