import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tabs from './tabs';

document.addEventListener('DOMContentLoaded', () => {
    const clock = document.getElementById('cl');
    ReactDOM.render(<Clock />, clock);

    const tab = document.getElementById('tab');
    ReactDOM.render(<Tabs />, tab);
})