$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

 // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


 	$('form#newComment').submit(function(e){
 		e.preventDefault();
 		$.ajax({
		  type: $(this).attr('method'),
		  url: $(this).attr('action'),
		  data: $(this).serialize(),
		  dataType: "json"
		}).done(function(data) {
			$('ul#comment_list').append('<li>' + data.comment + '</li><button>'+ "delete" + '</button>')
		})
 	})


// #APPLYING AJAX TO IMPLEMENT VOTING ON POSTS
 	 $('form#postVote').submit(function(e){
 		e.preventDefault();
 		$.ajax({
		  type: $(this).attr('method'),
		  url: $(this).attr('action'),
		  dataType: 'json'
		}).done(function(e) {
			$("#vote-count").html(e["count"]);
		
		})
 	})
});
