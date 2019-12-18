console.log("Webpack is working!");


const GameView = require("./game_view.js");

window.addEventListener('DOMContentLoaded', (event) => {
  const canvas = document.getElementById('game-canvas');
  const ctx = canvas.getContext("2d");
  
  new GameView(ctx).start();
});