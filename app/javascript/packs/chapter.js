$(document).on('turbolinks:load' ,function(){
		$('.list-select').click(function(){
		debugger
		var id = $(this).data('id');
		var book_id = $('#rate_rate_duty_id').val();
		$.ajax({
			url: '/books/'+ book_id +'/chapters',
			type: 'get',
			dataType: 'json',
			data: {
				book_id: book_id,
				title: $('#list-select-' + id).val()
			},
			success: function(data){
				$('.body-chapter').replaceWith(data.data_chapters)
				$('.list-chapter').hide()
			}
		})
	})	
});