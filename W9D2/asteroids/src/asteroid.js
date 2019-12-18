const MovingObject = require("./moving_object.js");
const Util = require("./util.js");

Asteroid.COLOR = "#574D4C";
Asteroid.RADIUS = 45;

function Asteroid ({pos}, game) {
  this.game = game;
  this.pos = pos;
  this.vel = Util.randomVec(10);
  this.color = Asteroid.COLOR;
  this.radius = Asteroid.RADIUS;
  let options = {
    pos: this.pos,
    vel: this.vel,
    color: this.color,
    radius: this.radius,
    game: this.game
  };
  MovingObject.call(this, options);
};

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
