$(document).on('turbolinks:load', function() {
	$('.single-email').on('click', function() {
		$.ajax({
		  url: "/customers/send_single_mail",
		  method: 'POST',
		  cache: false,
		  data: { id: $(this).data("id") },
		  success: function(html){
		    // $("#results").append(html);
		  }
		});
	});

	$('.all-email').on('click', function() {
		$.ajax({
		  url: "/customers/send_all_mail",
		  method: 'POST',
		  cache: false,
		  success: function(html){
		    // $("#results").append(html);
		  }
		});
	});
});