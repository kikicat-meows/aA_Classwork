/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\n\nAsteroid.COLOR = \"#574D4C\";\nAsteroid.RADIUS = 45;\n\nfunction Asteroid ({pos}, game) {\n  this.game = game;\n  this.pos = pos;\n  this.vel = Util.randomVec(10);\n  this.color = Asteroid.COLOR;\n  this.radius = Asteroid.RADIUS;\n  let options = {\n    pos: this.pos,\n    vel: this.vel,\n    color: this.color,\n    radius: this.radius,\n    game: this.game\n  };\n  MovingObject.call(this, options);\n};\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\n\nconst Game = function() {\n  this.dimX = 960; //something between 0 to 960\n  this.dimY = 640; //something between 0 to 640\n  this.numAsteroids = 10; // ??\n  this.asteroids = [];\n  // call addAsteroids (probably adds numAsteroids amount iteratively)\n  // for (i in numAsteroids) - ES6 (like .times)\n  for (let i = 0; i < this.numAsteroids; i++) {\n    this.addAsteroids();\n  }\n};\n\nGame.prototype.addAsteroids = function() {\n  let asteroid = new Asteroid(this.randomPosition(), this);\n  return this.asteroids.push(asteroid);\n};\n\n// return {pos: [x, y]}\n// will be passed in addAsteroid to create new Asteroid(randomPosition)\nGame.prototype.randomPosition = function() {\n  let x = Math.random() * this.dimX;\n  let y = Math.random() * this.dimY;\n\n  let obj = { pos: [x, y]};\n\n  return obj;\n};\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0, 0, this.dimX, this.dimY);\n\n  for (let index = 0; index < this.asteroids.length; index++) {\n    const element = this.asteroids[index];\n    \n    element.draw(ctx);\n  }\n}\n\nGame.prototype.move = function() {\n  for (let index = 0; index < this.asteroids.length; index++) {\n    const element = this.asteroids[index];\n\n    element.move();\n  }\n}\n\nGame.prototype.wrap = function(pos) {\n  let [x, y] = pos;\n\n  let wrappedX;\n  let wrappedY;\n\n  if (x > this.dimX) {\n    wrappedX = 0;\n  } else if (x < 0) {\n    wrappedX = this.dimX;\n  } else {\n    wrappedX = x;\n  }\n\n  if (y > this.dimY) {\n    wrappedY = 0;\n  } else if (y < 0) {\n    wrappedY = this.dimY;\n  } else {\n    wrappedY = y;\n  }\n\n  let wrappedPos = [wrappedX, wrappedY];\n  return wrappedPos;\n}\n\nGame.prototype.checkCollisions = function() {\n  for (let i = 0; i < this.asteroids.length; i++) {\n    let obj1 = this.asteroids[i];\n    for (let j = i + 1; j < this.asteroids.length; j++) {\n      let obj2 = this.asteroids[j];\n\n      if (obj1.isCollidedWith(obj2)) {\n        obj1.collideWith(obj2);\n      }\n    }\n  }\n};\n\nGame.prototype.remove = function(asteroid) {\n  let index = this.asteroids.indexOf(asteroid);\n\n  if (index > -1) {\n    this.asteroids = this.asteroids.splice(index, 1);\n  }\n\n  return this.asteroids;\n}\n\nGame.prototype.step = function() {\n  this.move();\n  this.checkCollisions();\n};\n\n\nmodule.exports = Game;\n\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nconst GameView = function(ctx) {\n  this.game = new Game();\n  this.ctx = ctx;\n\n};\n\nGameView.prototype.start = function() {\n  setInterval(this._moveAsteroid.bind(this), 20);\n};\n\nGameView.prototype._moveAsteroid = function() {\n  // this.game.move();\n  this.game.step();\n  this.game.draw(this.ctx);\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("console.log(\"Webpack is working!\");\n\n\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n  const canvas = document.getElementById('game-canvas');\n  const ctx = canvas.getContext(\"2d\");\n  \n  new GameView(ctx).start();\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\n\nconst MovingObject = function({pos, vel, radius, color, game}) {\n  // pos & vel are in [x, y] format\n  this.pos = pos;\n  this.vel = vel;\n  // radius is a circle\n  this.radius = radius;\n  // color will store color code string\n  this.color = color;\n  this.game = game;\n};\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.fillStyle = this.color;\n  ctx.beginPath();\n\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, false);\n\n  ctx.fill();\n};\n\nMovingObject.prototype.move = function() {\n  let [x, y] = this.pos;\n  let [dX, dY] = this.vel;\n\n  let newPos = this.game.wrap([x+dX, y+dY])\n\n  this.pos = newPos;\n};\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n  let [x, y] = this.pos;\n  let [x2, y2] = otherObject.pos;\n  let dist = Math.sqrt(((x2 - x) ** 2) + ((y2 - y) ** 2));\n\n  return (dist < (this.radius + otherObject.radius));\n};\n\nMovingObject.prototype.collideWith = function(otherObject) {\n  this.game.remove(this);\n  this.game.remove(otherObject);\n}\n\n\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n  inherits(childClass, parentClass) {\n    function Surrogate() {}\n    Surrogate.prototype = parentClass.prototype;\n    childClass.prototype = new Surrogate();\n    childClass.prototype.constructor = childClass;\n  },\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n};\n\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });