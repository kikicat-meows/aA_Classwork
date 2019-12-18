class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    let $li = $('li');

    $li.click((event) => {
      let $square = $(event.currentTarget);
      // alert ($square.data("pos"));
      this.makeMove($square);
    });
    
  };

  makeMove($square) {
    let pos = $square.data("pos");
    let currentPlayer = this.game.currentPlayer;

    try {
      this.game.playMove(pos);
    } catch (e) {
      alert (`This ${e.msg.toLowerCase()}`);
      return;
    }
    $square.addClass(currentPlayer);

    if (this.game.isOver()) {
      // cleanup click handlers.
      this.$el.off("click");
      this.$el.addClass("game-over");

      const winner = this.game.winner();
      const $figcaption = $("<figcaption>");

      if (winner) {
        this.$el.addClass(`winner-${winner}`);
        $figcaption.html(`You win, ${winner}!`);
      } else {
        $figcaption.html("It's a draw!");
      }

      this.$el.append($figcaption);
    }
  }

  setupBoard() {
    let $ul = $("<ul>");

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let $li = $("<li>");
        $li.data("pos", [i, j]);

        $ul.append($li);
      }
    }

    this.$el.append($ul);
  }
}

module.exports = View;
