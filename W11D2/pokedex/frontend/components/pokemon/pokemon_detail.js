import React from 'react';
import { withRouter } from 'react-router-dom';

class PokemonDetail extends React.Component {
  constructor(props){
    super(props);
  }

  componentDidMount() {
    this.props.requestAPoke(this.props.match.params.pokemonID);
    // debugger;
  }

  componentDidUpdate(prevProps) {
    if (prevProps.match.params.pokemonID !== this.props.match.params.pokemonID) {
      this.props.requestAPoke(this.props.match.params.pokemonID);
      // debugger;
    }
  }

  render() {
    // debugger;
    const poke = this.props.pokemon[this.props.match.params.pokemonID - 1];
    const itemsObj = this.props.items;
    // array starts at 0, pokemon ID starts at 1
    console.log(poke);
    let itemsArr = [];

    if (itemsObj) {
      for (let k in itemsObj) {
        itemsArr.push([itemsObj[k].name, itemsObj[k].price, itemsObj[k].happiness]);
      }
    }

    let itemsString = itemsArr.join(" ");

    return (
      <div className="pokemon-details">
        <img src={poke.image_url}></img>
        <h1>{poke.name}</h1>
        <ul>
          {
            <div className="poke-details">
              <li>Attack: {poke.attack}</li>
              <li>Defense: {poke.defense}</li>
              <li>Type: {poke.poke_type}</li>
              <li>Moves: {poke.moves}</li>
              <li>Items: {itemsString}</li>
            </div>
          }
        </ul>
      </div>
    );
  }
}

export default withRouter(PokemonDetail)