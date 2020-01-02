import React from 'react';
import ReactDOM from 'react-dom';
import configStore from './store/store';
import Root from './components/root';
import * as Selector from './reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {
    const store = configStore();
    window.store = store;
    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, root);
})