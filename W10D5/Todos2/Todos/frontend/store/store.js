import { createStore, applyMiddleware } from 'redux';
import rootReducer from './../reducers/root_reducer';
import { thunk } from './../middleware/thunk';
// import logger from 'redux-logger';

const configStore = (preloadedState = {}) => {

    return createStore(
        rootReducer, 
        preloadedState,
        applyMiddleware(thunk));
}

export default configStore;