const Asteroid = require("./asteroid.js");

const Game = function() {
  this.dimX = 960; //something between 0 to 960
  this.dimY = 640; //something between 0 to 640
  this.numAsteroids = 10; // ??
  this.asteroids = [];
  // call addAsteroids (probably adds numAsteroids amount iteratively)
  // for (i in numAsteroids) - ES6 (like .times)
  for (let i = 0; i < this.numAsteroids; i++) {
    this.addAsteroids();
  }
};

Game.prototype.addAsteroids = function() {
  let asteroid = new Asteroid(this.randomPosition(), this);
  return this.asteroids.push(asteroid);
};

// return {pos: [x, y]}
// will be passed in addAsteroid to create new Asteroid(randomPosition)
Game.prototype.randomPosition = function() {
  let x = Math.random() * this.dimX;
  let y = Math.random() * this.dimY;

  let obj = { pos: [x, y]};

  return obj;
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.dimX, this.dimY);

  for (let index = 0; index < this.asteroids.length; index++) {
    const element = this.asteroids[index];
    
    element.draw(ctx);
  }
}

Game.prototype.move = function() {
  for (let index = 0; index < this.asteroids.length; index++) {
    const element = this.asteroids[index];

    element.move();
  }
}

Game.prototype.wrap = function(pos) {
  let [x, y] = pos;

  let wrappedX;
  let wrappedY;

  if (x > this.dimX) {
    wrappedX = 0;
  } else if (x < 0) {
    wrappedX = this.dimX;
  } else {
    wrappedX = x;
  }

  if (y > this.dimY) {
    wrappedY = 0;
  } else if (y < 0) {
    wrappedY = this.dimY;
  } else {
    wrappedY = y;
  }

  let wrappedPos = [wrappedX, wrappedY];
  return wrappedPos;
}

Game.prototype.checkCollisions = function() {
  for (let i = 0; i < this.asteroids.length; i++) {
    let obj1 = this.asteroids[i];
    for (let j = i + 1; j < this.asteroids.length; j++) {
      let obj2 = this.asteroids[j];

      if (obj1.isCollidedWith(obj2)) {
        obj1.collideWith(obj2);
      }
    }
  }
};

Game.prototype.remove = function(asteroid) {
  let index = this.asteroids.indexOf(asteroid);

  if (index > -1) {
    this.asteroids = this.asteroids.splice(index, 1);
  }

  return this.asteroids;
}

Game.prototype.step = function() {
  this.move();
  this.checkCollisions();
};


module.exports = Game;

