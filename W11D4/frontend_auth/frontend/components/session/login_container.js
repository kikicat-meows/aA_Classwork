import { connect } from 'react-redux';
import { login } from '../../actions/session';
import Login from './login';


const matchDispatchToProps = dispatch => ({
    login: formUser => dispatch(login(formUser)),
});

export default connect(null, matchDispatchToProps)(Login);