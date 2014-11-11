(function () {
    if (typeof Asteroids === "undefined") {
        window.Asteroids = {};
    }
    
    var DIM_X = 2000;
    var DIM_Y = 1500;
    var NUM_ASTEROIDS = 5000;
    
    var Game = Asteroids.Game = function () {
        this.asteroids = [];
        this.addAsteroids();
    };
    
    Game.prototype.addAsteroids = function () {
        for (var i = 0; i < NUM_ASTEROIDS; i++) {
            this.asteroids.push( new Asteroids.Asteroid({pos: this.randomPosition()}));
        }
    };
    
    Game.prototype.randomPosition = function () {
        return [Math.random() * DIM_X, Math.random() * DIM_Y];
    };
    
    Game.prototype.draw = function (ctx) {
        ctx.clearRect(0, 0, DIM_X, DIM_Y);
        this.asteroids.forEach(function (asteroid) {
            asteroid.draw(ctx)
        });
    };
    
    Game.prototype.move = function () {
        this.asteroids.forEach(function (asteroid) {
            asteroid.move()
        });
    };

    
})();
