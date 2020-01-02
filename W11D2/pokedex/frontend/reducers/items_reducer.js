import { RECEIVE_A_POKE } from '../actions/pokemon_actions';

const itemsReducer = (state = {}, action) => {
  Object.freeze(state);
  // const nextState = Object.assign({}, state);
  let nextState;

  switch (action.type) {
    case RECEIVE_A_POKE:

      // for (let itemID of Object.keys(action.poke.items)) {
      //   nextState[itemID] = action.poke.items[itemID];
      // }

      // return nextState;
      return action.poke.items;

    default:
      return state;
  }
};

export default itemsReducer;