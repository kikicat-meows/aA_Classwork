import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

export default class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    // console.log(this.props.pokemon);
    const pokemon = this.props.pokemon;
    // console.log(pokemon);
    const pokemonItems = pokemon.map (poke => (
      <PokemonIndexItem key={poke.id} poke={poke} />
    ));

    return (
      <div className="pokemon-index">
        {/* <h1> All Pokemons </h1> */}
        <ul>
          {pokemonItems}
        </ul>
      </div>
    );
  }
} 
