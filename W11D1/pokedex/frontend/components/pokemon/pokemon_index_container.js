import { connect } from 'react-redux';
import PokemonIndex from './pokemon_index'
import { receiveAllPokemon, requestAllPokemon } from './../../actions/pokemon_actions';
import { selectAllPokemon } from './../../reducers/selectors';

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state)
});

const mapDispatchToProps = dispatch => ({
  // receiveAllPokemon: pokemon => dispatch(receiveAllPokemon(pokemon)),
  requestAllPokemon: () => dispatch(requestAllPokemon())
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex);


