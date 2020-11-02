$(document).on('turbolinks:load', function(){
	$(document).on('click', '.post-comment', function(){
		debugger
		$.ajax({
			url: '/comments',
			method: 'POST',
			dataType: 'json',
			data: {
				authenticity_token: $('[name="csrf-token"]')[0].content,
				cmt_duty_id: $('#comment_cmt_duty_id').val(),
				cmt_duty_type: $('#comment_cmt_duty_type').val(),
				user_id: $('#comment_user_id').val(),
				content: $('#comment_content').val()
			},

			success: function(data){
				$('.append-comment').append(data.data_comment)
			}
		})
	})
})	