Journal.Collections.Posts = Backbone.Collection.extend({

  model: Journal.Models.Post,
  url: "/posts",
  
  getOrFetch: function (id){
    var post = this.get(id);
    if (post === undefined) {
      post = new Journal.Models.Post({id: id});
    }
    
    post.fetch();
    return post;
  }

});

Journal.posts = new Journal.Collections.Posts();