(function () {
    if (typeof Asteroids === "undefined") {
        window.Asteroids = {};
    }
    
    var GameView = Asteroids.GameView = function() {
        this.game = new Asteroids.Game();
    };
    
    GameView.prototype.start = function (canvasEl) {
        var ctx = canvasEl.getContext("2d");

        window.setInterval((function () {
          this.game.move();
          this.game.draw(ctx);
        }).bind(this), 20);
      };
    
})();