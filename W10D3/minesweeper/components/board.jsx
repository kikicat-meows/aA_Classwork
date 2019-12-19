import React from 'react';
import Tile from './tile';

export default class Board extends React.Component {
    constructor(props) {
        super(props);
        this.renderRow = this.renderRow.bind(this);
        this.renderTile = this.renderTile.bind(this);
    }


    renderRow () {
        const board = this.props.board;

        return (
            board.grid.map((row, i) => {
                return (
                    <div className="row" key={`row-${i}`}>
                        {this.renderTile(row, i)}
                    </div>
                );
            })
        )
    }

    renderTile (row, i) {
        return (
            row.map((tile, j) => {
                return (
                    <Tile tile={tile} updateGame={this.props.updateGame} key={`tile-${i}-${j}`} />
                );
            })
        );
    }

    render () {
        return (
            <div>
                { this.renderRow() }
            </div>
        );
    }
}

