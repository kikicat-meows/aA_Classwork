import React from 'react';

export default class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    // console.log(this.props.pokemon);
    let pokemon = this.props.pokemon;
    return (
      <div>
        <h1> All Pokemons </h1>

      </div>
    )
  }
} 
