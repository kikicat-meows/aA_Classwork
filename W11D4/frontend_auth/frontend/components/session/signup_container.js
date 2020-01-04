import { connect } from 'react-redux';
import { createNewUser } from '../../actions/session';
import Signup from './signup';


// takes in a dispatch call (of createNewUser)
// takes in formUser object and make dispatch call
const matchDispatchToProps = dispatch => ({
    createNewUser: formUser => dispatch(createNewUser(formUser)),
});

export default connect(null, matchDispatchToProps)(Signup);