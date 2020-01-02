import { RECEIVE_ALL_POKEMON, RECEIVE_A_POKE } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  const nextState = Object.assign({}, state);

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      // debugger
      // object (action.pokemon) is a hash, has to iterate through hash.keys then remap with value
      for (let pokeID of Object.keys(action.pokemon)) {
        nextState[pokeID] = action.pokemon[pokeID];
      }
      // of stands for array, in is for hash, so the below works.
      // for (let pokeID in action.pokemon) {
      //   let poke = action.pokemon[pokeID];
      //   nextState[pokeID] = poke;
      // }
      return nextState;

    case RECEIVE_A_POKE:
      // debugger;
      nextState[action.poke.pokemon.id] = action.poke.pokemon;
      // nextState[items] = actions.poke.items; //item reducer placeholder
      // nextState[action.poke] = action.poke;
      return nextState;
    default:
      return state;
  }
};

export default pokemonReducer;