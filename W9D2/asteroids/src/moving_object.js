const Game = require("./game.js")

const MovingObject = function({pos, vel, radius, color, game}) {
  // pos & vel are in [x, y] format
  this.pos = pos;
  this.vel = vel;
  // radius is a circle
  this.radius = radius;
  // color will store color code string
  this.color = color;
  this.game = game;
};

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, false);

  ctx.fill();
};

MovingObject.prototype.move = function() {
  let [x, y] = this.pos;
  let [dX, dY] = this.vel;

  let newPos = this.game.wrap([x+dX, y+dY])

  this.pos = newPos;
};

MovingObject.prototype.isCollidedWith = function(otherObject) {
  let [x, y] = this.pos;
  let [x2, y2] = otherObject.pos;
  let dist = Math.sqrt(((x2 - x) ** 2) + ((y2 - y) ** 2));

  return (dist < (this.radius + otherObject.radius));
};

MovingObject.prototype.collideWith = function(otherObject) {
  this.game.remove(this);
  this.game.remove(otherObject);
}



module.exports = MovingObject;