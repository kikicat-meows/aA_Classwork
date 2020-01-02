import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './pokemon/pokemon_index_container';
import PokemonDetailContainer from './pokemon/pokemon_detail_container';
import { HashRouter, Route } from 'react-router-dom';

const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      {/* <PokemonIndexContainer /> */}
      {/* :pokemonID is the name of the wildcard in params, so must invoke this */}
      <div className="wrapper">
        <Route path="/" component={PokemonIndexContainer} />
        <Route path="/pokemon/:pokemonID" component={PokemonDetailContainer} />
      </div>
    </HashRouter>
  </Provider>
);

export default Root;