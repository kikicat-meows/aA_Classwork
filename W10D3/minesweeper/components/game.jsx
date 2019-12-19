import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board';


export default class Game extends React.Component {
    constructor(props) {
        super(props);
        const board = new Minesweeper.Board(9, 10);
        this.state = { 
            board : board 
        }; 
        this.updateGame = this.updateGame.bind(this);
        this.restartGame = this.restartGame.bind(this);
    }

    restartGame() {
        const board = new Minesweeper.Board(9, 10);
        this.setState({ board: board });
    }

    updateGame(tile, flagged) {
        if (flagged) {
            tile.toggleFlag();
        } else {
            tile.explore();
        }

        this.setState({board : this.state.board})
    }

    render() {
        let gameOver = (this.state.board.won() || this.state.board.lost()) ? true : false;
        let msg, modal;

        if (gameOver) {
            msg = this.state.board.won() ? "You won." : "You lost.";
            modal = 
            <div className="modal-screen">
                <div className="modal-form">
                    <p>{msg}</p>
                    <button onClick={this.restartGame}>Play Again</button>
                </div>
            </div>
        }


        return (
            <div>
                {modal}
                <Board board={this.state.board} updateGame={this.updateGame} />
            </div>
        );
    }

}