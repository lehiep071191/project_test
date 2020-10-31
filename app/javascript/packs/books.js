$(document).on('turbolinks:load', function(){
	// createbook
	$('.book-new').click(function(){
		$('.book-form').toggle();
	})
	$('.create-book').click(function(){
		$.ajax({
			url: '/admin/books',
			method: 'post',
			dataType: 'json',
			data: {
				authenticity_token: $('[name="csrf-token"]')[0].content,
				title: $('#book_title').val(),
				author: $('#book_author').val(),
				description: $('#book_description').val(),
				category: $('#book_category').val(),

			},
			success: function(data){
				$('#append-book').append(data.data_book)
				$('.book-form').hide()
			}
		})
	})
	// update book
	$(document).on('click', '.edit-book', function(){
		 book_id = $(this).data('id');
		$('#book-form-edit-'+book_id).toggle()
	})

	$(document).on('click', '.update-book',function(){
		var book_id = $(this).data('id');
		debugger
		$.ajax({
			url: '/admin/books/'+book_id,
			type: 'PUT',
			dataType: 'json',
			data:{
				authenticity_token: $('[name="csrf-token"]')[0].content,
				title: $('#book_title-'+book_id).val(),
				author: $('#book_author-'+ book_id).val(),
				description: $('#book-description-'+book_id).val(),
				category: $('#book_category-'+book_id).val()
			},
			success: function(data){
				$('#book-'+book_id).replaceWith(data.data_bookupdate);
				alert('update success');
			}
		})
	})

});