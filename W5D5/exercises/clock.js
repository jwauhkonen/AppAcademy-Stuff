function Clock () {
  currentTime: null;
}

Clock.TICK = 5;

Clock.prototype.printTime = function () {
  // Format the time in HH:MM:SS
  console.log(this.currentTime.getHours() + 
      " : " + this.currentTime.getMinutes() +
      " : " + this.currentTime.getSeconds());
};

Clock.prototype.run = function () {
  // 1. Set the currentTime.
  // 2. Call printTime.
  // 3. Schedule the tick interval.
  // var currentMS = Date.now();
  this.currentTime = new Date(Date.now());
  this.printTime();
  setInterval(this._tick.bind(this), 5000);
};

Clock.prototype._tick = function () {
  // 1. Increment the currentTime.
  // 2. Call printTime.
  var seconds = this.currentTime.getSeconds() + Clock.TICK;
  var minutes = this.currentTime.getMinutes();
  var hours = this.currentTime.getHours();
  if (seconds >= 60) {
    seconds = seconds % 60;
    minutes += 1;
    if (minutes >= 60) {
      minutes = minutes % 60;
      hours += 1;
      if (hours >= 24) {
        hours = 0;
      }
    }
  }
  this.currentTime.setSeconds(seconds);
  this.currentTime.setMinutes(minutes);
  this.currentTime.setHours(hours);
  this.printTime();
};

clock = new Clock();
clock.run();