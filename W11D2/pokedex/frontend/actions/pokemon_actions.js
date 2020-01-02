import * as APIUtil from './../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_A_POKE = 'RECEIVE_A_POKE';
export const START_LOADING_ALL_POKEMON = 'START_LOADING_ALL_POKEMON';
export const START_LOADING_A_POKE = 'START_LOADING_A_POKE';

export const receiveAllPokemon = (pokemon) => {
  return ({
    type: RECEIVE_ALL_POKEMON,
    pokemon
  });
};

export const receiveAPoke = (poke) => {
  return ({
    type: RECEIVE_A_POKE,
    poke
  });
};

export const startLoadingAllPokemon = () => {
  return ({
    type: START_LOADING_ALL_POKEMON
  });
};

export const startLoadingAPoke = () => {
  return ({
    type: START_LOADING_A_POKE
  });
};

export const requestAllPokemon = () => dispatch => {
  dispatch(startLoadingAllPokemon());
  return (APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon))));
};

export const requestAPoke = (id) => dispatch => (
  APIUtil.fetchAPoke(id)
    .then(poke => dispatch(receiveAPoke(poke)))
);
