(function () {
    if (typeof Asteroids === "undefined") {
        window.Asteroids = {};
    }
    
    var COLOR = "#9933FF";
    var RADIUS = 10;
    
    var Asteroid = Asteroids.Asteroid = function (params) {

        params["vel"] = Asteroids.Util.randomVec(Math.random() * 20);
        params["color"] = COLOR;
        params["radius"] = RADIUS;
        Asteroids.MovingObject.call(this, params);        
    };
    
    Asteroids.Util.inherits(Asteroid, Asteroids.MovingObject);
    
})();