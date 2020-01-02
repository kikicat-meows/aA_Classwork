import { connect } from 'react-redux';
import { receiveAPoke, requestAPoke } from './../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';
import { selectAllPokemon, selectAllItems } from './../../reducers/selectors';

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state),
  items: selectAllItems(state)
});

const mapDispatchToProps = dispatch => ({
  requestAPoke: (id) => dispatch(requestAPoke(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);