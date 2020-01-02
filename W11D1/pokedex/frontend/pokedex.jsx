import React from 'react';
import ReactDOM from 'react-dom';
import * as APIUtils from './util/api_util';
import { requestAllPokemon } from './actions/pokemon_actions';
import configStore from './store/store';
import { selectAllPokemon } from './reducers/selectors';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.APIUtils = APIUtils;
  window.selectAllPokemon = selectAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  ReactDOM.render(<Root store={store}/>, rootEl);
});