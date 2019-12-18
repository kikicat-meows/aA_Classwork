const View = require("./ttt-view.js"); // require appropriate file
const Game = require("./game.js"); // require appropriate file

  $(() => {
    // Your code here
    const board = $('.ttt');
    const game = new Game();
    new View(game, board);
  });
