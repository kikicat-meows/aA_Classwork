import { RECEIVE_ERRORS, CLEAR_ERRORS } from './../actions/error_actions';

const errorReducer = (state = {}, action) => {

    Object.freeze(state);
    const newState = Object.assign({}, state);

    switch (action.type) {
        case "RECEIVE_ERRORS":
            newState[action.error] = action.errors
            return newState;
        case "CLEAR_ERRORS":
            // return []; ??? return array or object-wrapped array;
        default:
            return state;
    }
}

export default errorReducer;