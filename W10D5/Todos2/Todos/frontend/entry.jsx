import React from 'react';
import ReactDOM from 'react-dom';
import configStore from './store/store';
import Root from './components/root';
import * as Selector from './reducers/selectors';
import * as TodoAPIUtil from './util/todo_api_util';
// import { createTodo } from './actions/todo_actions';

document.addEventListener('DOMContentLoaded', () => {
    const store = configStore();
    window.store = store;
    // window.createTodo = createTodo;
    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, root);
})