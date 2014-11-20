window.Journal = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
      var router = new Journal.Routers.Posts({$rootEl: $("#main")});
      Backbone.history.start();
  }
};

$(document).ready(function(){
  Journal.initialize();
});
