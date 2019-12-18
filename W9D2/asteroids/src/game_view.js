const Game = require("./game.js");

const GameView = function(ctx) {
  this.game = new Game();
  this.ctx = ctx;

};

GameView.prototype.start = function() {
  setInterval(this._moveAsteroid.bind(this), 20);
};

GameView.prototype._moveAsteroid = function() {
  // this.game.move();
  this.game.step();
  this.game.draw(this.ctx);
}

module.exports = GameView;