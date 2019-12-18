import React from 'react';

class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            date: '',
            hour: '',
            minute: '',
            second: ''
        }
    }


    tick() {
        const currentTime = new Date();
        const currentDate = currentTime.toDateString();
        const currentHours = currentTime.getHours();
        const currentMinutes = currentTime.getMinutes();
        const currentSeconds = currentTime.getSeconds();
        this.setState({
            date: currentDate,
            hour: currentHours,
            minute: currentMinutes,
            second: currentSeconds
        });
    }

    parseTime(time) {
        time = (time < 10 ? "0" : "") + time.toString();
        return time;
    }

    componentDidMount() {
        const currentTime = new Date();
        const currentDate = currentTime.toDateString();
        const currentHours = currentTime.getHours();
        const currentMinutes = currentTime.getMinutes();
        const currentSeconds = currentTime.getSeconds();
        this.setState({
            date: currentDate,
            hour: currentHours,
            minute: currentMinutes,
            second: currentSeconds
        });
        this.interval = setInterval(this.tick.bind(this), 1000);
    }

    componentWillUnmount() {
        clearInterval(this.interval);
    }

    render() {

        return (
            <div>
                <h1>Clock</h1>
                <div className="clock">
                    <p>
                        <span>Date: </span>
                        <span>{this.state.date}</span>
                    </p>
                    <p>
                        <span>Time: </span>
                        <span>
                            <span id="hour">{this.parseTime(this.state.hour)}:</span>
                            <span id="minute">{this.parseTime(this.state.minute)}:</span>
                            <span id="second">{(this.parseTime(this.state.second))} PDT</span>
                        </span>
                    </p>
                </div>
            </div>
        );
    }

}


export default Clock;