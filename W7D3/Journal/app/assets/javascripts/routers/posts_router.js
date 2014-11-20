Journal.Routers.Posts = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    
  },
  
  routes: {
    "": "index",
    "posts/:id": "show",
    "posts/:id/edit": "edit"
  },
  
  index: function () {
    var posts = Journal.posts;
    var indexView = new Journal.Views.PostsIndex({ collection: posts });
    posts.fetch();
    this.$rootEl.html(indexView.render().$el);
  },
  
  show: function (id) {
    var post = Journal.posts.getOrFetch(id);
    var showView = new Journal.Views.PostsShow({ model: post})
    this.$rootEl.html(showView.render().$el);
  },
  
  edit: function(id){
    var post = Journal.posts.getOrFetch(id);
    var editView = new Journal.Views.PostsForm({model: post});
    this.$rootEl.html(editView.render().$el);
  }
});
