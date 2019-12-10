class Clock {
  constructor() {
    // 1. Create a Date object.
    const currentTime = new Date();
    // console.log(currentTime);
    // 2. Store the hours, minutes, and seconds.
    this.currentHours = currentTime.getHours();
    this.currentMinutes = currentTime.getMinutes();
    this.currentSeconds = currentTime.getSeconds();
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    let formattedMinutes = (this.currentMinutes < 10 ? "0" : "") + this.currentMinutes.toString();
    let formattedSeconds = (this.currentSeconds < 10 ? "0" : "") + this.currentSeconds.toString();
    let formattedTime = `${this.currentHours}:${formattedMinutes}:${formattedSeconds}`;
    // Use console.log to print it.
    console.log(formattedTime);
  }

  _tick() {
    // 1. Increment the time by one second.
    this.currentSeconds = this.currentSeconds + 1;

    if (this.currentSeconds === 60) {
      this.currentSeconds = 0;
      this.currentMinutes = this.currentMinutes + 1;
    }

    if (this.currentMinutes === 60) {
      this.currentMinutes = 0;
      this.currentHours = this.currentHours + 1;
    }

    // 2. Call printTime.
    console.clear();
    this.printTime();
  }
}

const clock = new Clock();