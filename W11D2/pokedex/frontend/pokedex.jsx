import React from 'react';
import ReactDOM from 'react-dom';
import configStore from './store/store';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';
import * as APIUtils from './util/api_util';
import { requestAllPokemon, receiveAPoke } from './actions/pokemon_actions';
// import { selectAllPokemon } from './reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.APIUtils = APIUtils;
  // window.selectAllPokemon = selectAllPokemon;
  // window.requestAllPokemon = requestAllPokemon;
  window.receiveAPoke = receiveAPoke;
  ReactDOM.render(<Root store={store}/>, rootEl);
});