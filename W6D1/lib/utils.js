(function () {
    if (typeof Asteroids === "undefined") {
        window.Asteroids = {};
    }
    
    var Util = Asteroids.Util = {};
        
    Util.inherits = function(childClass, SuperClass) {
        function Surrogate () {}
        Surrogate.prototype = SuperClass.prototype;
    
        childClass.prototype = new Surrogate();
    };
    
    Util.randomVec = function(length) {
        var x = Math.random() * length;
        var y = Math.sqrt((length * length) - (x * x));
        
        return [x, y];
    }
    
    
    
    
    
})();