Function.prototype.myBind = function(context) {
  // returna function that returns something that invokes the context;
 
  return (args) => {
    // console.log(context);
    this.apply(context, args); 
  };
};

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function (arg) {
  console.log("Turning on " + this.name + " " + arg);
};

const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

// const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

// boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(['now']); // should say "Turning on a lamp"


/// BIND TIME arguments better for when you want to predefine an action (and not allow modifications / flexibility) i.e. button clicks;
/// CALL TIME arguments better for when you want to define an action but leave arguments flexible for use.