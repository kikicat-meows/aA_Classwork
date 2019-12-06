let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8);

  for (let i = 0; i < grid.length; i++) {
    grid[i] = new Array(8);
  }

  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");

  return grid;
};

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  let [x, y] = pos; 
  // or [x, y] = [...pos];

  if (!this.isValidPos) {
    throw new Error("Not valid pos!");
  }

  return this.grid[x][y];
  
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length > 0;
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  // let [x, y] = pos;

  // return this.grid[x][y] ? (this.grid[x][y].color === color) : false;
  
  return this.isOccupied(pos) ? this.getPiece(pos).color === color : false;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  let piece = this.getPiece(pos);

  return piece instanceof Piece;
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !this.hasMove("black") && !this.hasMove("white"); 
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let [x,y] = pos;

  return ((x >= 0 && x < 8) && (y >= 0 && y < 8));
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */


function _positionsToFlip (board, pos, color, dir, piecesToFlip = []) {
// break conditions
  let [x, y] = pos;
  let [dX, dY] = dir;
  let newPos = [x + dX, y + dY];
// if it reaches end of the board isValidPos
  if (!board.isValidPos(newPos)) {
    return [];
  }
// if there's an empty space isOccupied
  if (!board.isOccupied(newPos)) {
    return [];
  }
// if it hits the same color isMine (only after the other two passes)
  if (board.isMine(newPos, color)) {
    return piecesToFlip;
  }


  piecesToFlip.push(newPos);

  return _positionsToFlip(board, newPos, color, dir, piecesToFlip);
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  let [row,col] = pos;

  if (!this.validMove(pos, color)) {
    throw new Error("Invalid Move");
  }

  let flippablePieces = [];

  for (let i = 0; i < Board.DIRS.length; i++) {
    let dir = Board.DIRS[i];
    let newPosArr = _positionsToFlip(this, pos, color, dir);
    flippablePieces = flippablePieces.concat(newPosArr);
  }

  for (let j = 0; j < flippablePieces.length; j++) {
    this.getPiece(flippablePieces[j]).flip();
  }

  return this.grid[row][col] = new Piece(color);
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  let boardGraphic = [];

  for (let i = 0; i < this.grid.length; i++) {
    let subGraph = [];     
    for (let j = 0; j < this.grid.length; j++) {
      if (this.isOccupied([i,j])) {
        let piece = this.getPiece([i,j]);
        subGraph.push(piece.toString());
      } else {
        subGraph.push("_");
      }
    }  
    boardGraphic.push(subGraph.join(" | "));
  }

  for (let idx = 0; idx < boardGraphic.length; idx++) {
    let row = boardGraphic[idx];
    console.log(row);
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  let [x,y] = pos;

  if (this.isOccupied(pos)) {
    return false;
  }

  // let flippablePieces = [];

  for (let i = 0; i < Board.DIRS.length; i++) {
    let dir = Board.DIRS[i];
    let newPosArr = _positionsToFlip(this, pos, color, dir);
    if (newPosArr.length > 0) {
      return true;
    }
    // flippablePieces = flippablePieces.concat(newPosArr);
  }

  // return flippablePieces.length > 0;
  return false;
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let validMovePositions = [];

  for (let i = 0; i < this.grid.length; i++) {
    for (let j = 0; j < this.grid.length; j++) {
      if (this.validMove([i,j], color)) {
        validMovePositions.push([i,j]);
      }
    }
  }

  return validMovePositions;
};

module.exports = Board;
