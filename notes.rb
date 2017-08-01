## jQuery / AJAX examples

# Regular jQuery
$('.post-container').on('click', '.upvote-button', function(e){
  e.preventDefault();
  var $this = $(this);
  var $url = $this.closest('form').attr('action');
  var $points = $this.closest('article').find('.points');

  $this.addClass('red');

  $.ajax({
    method: 'POST',
    url: $url
  }).done(function(response){
    $points.text(response);
  });
});

# jQuery with JSON

$('.post-container').on('click', '.upvote-button', function(e){
  e.preventDefault();
  var $this = $(this);
  var $url = $this.closest('form').attr('action');
  var $points = $this.closest('article').find('.points');

  $this.addClass('red');

  $.ajax({
    method: 'POST',
    dataType: "json",
    url: $url
  }).done(function(response){
    $points.text(response.votes);
  });
});

# ---------------------------------- #
## Post route AJAX examples

# Without JSON
post '/posts/:id/vote' do
  post = Post.find(params[:id])
  post.votes.create(value: 1)
  if request.xhr?
    post.points.to_s
  else
    redirect "/posts"
  end
end

# With JSON
post '/posts/:id/vote' do
  post = Post.find(params[:id])
  post.votes.create(value: 1)
  if request.xhr?
    content_type :json
    {post: post.id, votes: post.points.to_s}.to_json
  else
    redirect "/posts"
  end
end

# ---------------------------------- #
## OOJS
http://javascriptissexy.com/oop-in-javascript-what-you-need-to-know/

# ---------------------------------- #
## Associations
* When you have a differently named association:
  has_many :purchases, foreign_key: "purchaser_id"

# ---------------------------------- #
## Time tests
OOJS (Bikes and Stations): 16 mins
OOJS (Gardens): 22 mins
