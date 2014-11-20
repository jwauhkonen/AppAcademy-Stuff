Journal.Views.PostsIndex = Backbone.View.extend({
  template: JST['posts/index'],
  
  initialize: function () {
    this.listenTo(
      this.collection, 
      "sync remove change:Title reset", 
      this.render
    );
  },
  
  events: {
    'click button' : 'handleRemove'
  },
  
  render: function () {
  
    var content = this.template({ 
      posts : this.collection 
    });
    this.$el.html(content);
    return this;
  },
  
  handleRemove: function(event){
    var id = $(event.currentTarget).data("id");
    var post = this.collection.get(id);
    post.destroy();
  }
});