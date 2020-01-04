import React from 'react';

export default class Signup extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            username: '',
            email: '',
            password: '',
        };
        this.handleSubmit = this.handleSubmit.bind(this);
    }


    // assume that the field will contain same name as state keys
    // see below render to get a better idea of what this do
    handleInput(type) {
        return (e) => {
            this.setState({ [type]: e.target.value });
        };
    }

    // prevent page from re-rendering
    handleSubmit(e) {
        e.preventDefault();
        // createNewUser is a dispatch props in container
        // ajax call then redirect us to chirps page using react router
        this.props.createNewUser(this.state)
            .then( () => this.props.history.push('./chirps'));
    }

    render () {
        return (
            <div className='session-form'>
                <h2>Sign Up!</h2>
                <form>
                    <label>Username:
                        <input 
                            type="text"
                            value={this.state.username}
                            onChange={this.handleInput('username')}
                        />
                    </label>
                    <label>Email:
                        <input 
                            type="text"
                            value={this.state.email}
                            onChange={this.handleInput('email')}
                        />
                    </label>
                    <label>Password:
                        <input 
                            type="password" 
                            value={this.state.password}
                            onChange={this.handleInput('password')}
                        />
                    </label>
                    <button onClick={this.handleSubmit}>Sign Up</button>
                </form>
            </div>
        );
    }
};

