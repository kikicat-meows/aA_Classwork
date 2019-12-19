import React from 'react';
import * as Minesweeper from '../minesweeper';

export default class Tile extends React.Component {
    constructor(props) {
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(event) {
        let flagged;

        if (event.altKey) {
            flagged = true; 
        } else {
            flagged = false;
        }

        this.props.updateGame(this.props.tile, flagged);
    }

    render() {
        const tile = this.props.tile;
        let display, classText;
// Tiles can be either explored, flagged, or unexplored. Explored tiles can either be bombed, or no bomb?

        if (tile.explored) {
            if (tile.bombed) {
                display = "💩";
                classText = "bombed";
            } else {
                let count = tile.adjacentBombCount();
                if (count === 0) {
                    display = "";
                } else {
                    display = count.toString();
                }
                classText = "explored";
            }
        } else if (tile.flagged) {
            display = "🧐";
            classText = "flagged";

        } else {
            display = "";
            classText = "tbd";
        }

        return (
            <div onClick={this.handleClick} className={`${classText} tile`}>
                {display}
            </div>
        );
    }
};
