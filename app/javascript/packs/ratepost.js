	$(document).on('turbolinks:load', function(){
		var book_id = $(".creat-rates").val();
		$(document).on('click', '.rates-post', function(){
			$('.rating-post').toggle()
		})
		$(document).on('click', '.rate-post', function(){
			debugger
			$.ajax({
				url: '/rates',
				method: 'POST',
				dataType: 'json',
				data: {
					authenticity_token: $('[name="csrf-token"]')[0].content,
					rate_duty_type: $('#rate_rate_duty_type').val(),
					rate_duty_id: $('#rate_rate_duty_id').val(),
					user_id: $('#rate-post-user').val(),
					rating: $('.star:checked').val() 
				},
				success: function(data){
					debugger
					alert('was rate')
					$('#rate-post').remove()
					$('#re-rate-post').append()
					$('.rating-post').hide()
				}
			})
		})

		$(document).on('click', '.re-rate-post', function(){
			debugger
			var rate_id = $(this).data('id');
			$.ajax({
				url: '/rates/'+ rate_id,
				method: 'post',
				dataType: 'json',
				data: {
					_method: 'PUT',
					authenticity_token: $('[name="csrf-token"]')[0].content,
					rate_duty_type: $('#rate_rate_duty_type').val(),
					rate_duty_id: $('#rate_rate_duty_id').val(),
					user_id: $('#rate-post-user').val(),
					rating: $('.star:checked').val() 
				},
				success: function(data){
					debugger
					alert('was update')
					$('.rating-post').hide()
				}
			})
		})
	});