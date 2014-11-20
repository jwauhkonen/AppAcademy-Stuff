Journal.Views.PostsForm = Backbone.View.extend({
  
  template: JST['posts/form'],
  
  initialize: function () {
    this.listenTo(this.model, "sync change", this.render)
  },
  
  events: {
    'click button': 'handleSubmit'
  },
  
  render: function () {
    var content = this.template({post: this.model});
    this.$el.html(content);
    return this;
  },
  
  handleSubmit: function (event) {
    // var id = $(event.currentTarget).data("id");
    debugger
    var postAttrs = $('#post-edit-form').serializeJSON();
      
    //something something JQuery serialize
    //maybe install it!!!!!
  }
});
