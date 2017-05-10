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

	$('.multi-email').on('click', function() {
		var min = $('#min').val();
		var max = $('#max').val();
		if(min == "") { 
			min = 1; 
		}
		if(max == "") { 
			max = 1; 
		}
		$.ajax({
		  url: "/customers/send_multi_mail",
		  method: 'POST',
		  data: { min: min, max : max },
		  cache: false,
		  success: function(html){
		    // $("#results").append(html);
		  }
		});
	});
});