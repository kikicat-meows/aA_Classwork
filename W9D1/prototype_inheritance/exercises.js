Function.prototype.inherits = function(superClass) {
    function Surrogate() {};
    Surrogate.prototype = superClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}

Function.prototype.inherits = function(superClass) {
    this.prototype = Object.create(superClass.prototype);
    this.prototype.constructor = this;
}

// factored from readings (using class method instead of functions)