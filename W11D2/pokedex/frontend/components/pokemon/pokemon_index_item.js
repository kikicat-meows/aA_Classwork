import React from 'react';
import { Link } from 'react-router-dom';

export default class PokemonIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const poke = this.props.poke;
    const pokemonID = poke.id;
    const link = `/pokemon/${pokemonID}`;
    // debugger;
    return (
      <li className="pokemon-index-item">
        <Link className="pokemon-index-item-text" to={link}>
          <span> {poke.id}  <img src={poke.image_url}></img> </span> <span> {poke.name} </span>
        </Link>
      </li>
    );
  }
}