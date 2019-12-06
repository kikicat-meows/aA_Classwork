/**
 * Initializes the Piece with its color.
 */
function Piece (color) {
  this.color = color;
};

/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {
  // if (this.color === 'white') {
  //   return 'black';
  // } else {
  //   return 'white';
  // }
  return (this.color === 'white' ? 'black' : 'white');
};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
  return (this.color === 'white' ? this.color = 'black' : this.color = 'white');
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {
  return (this.color === 'white' ? 'W' : 'B');
};

module.exports = Piece;
