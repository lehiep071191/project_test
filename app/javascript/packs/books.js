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

	$('.restore-book').click(function(){

		book_id = $(this).data('id');
		$('#restore-'+book_id).remove();
	})

	$(function(){
	  var str = '#len'; //increment by 1 up to 1-nelemnts
	  $(document).ready(function(){
	    var i, stop;
	    i = 1;
	    stop = 4; //num elements
	    setInterval(function(){
	      if (i > stop){
	        return;
	      }
	      $('#len'+(i++)).toggleClass('bounce');
	    }, 500)
	  });
	});
	$(function(){
	  var str = '#len'; //increment by 1 up to 1-nelemnts
	  $(document).ready(function(){
	    var i, stop;
	    i = 1;
	    stop = 4; //num elements
	    setInterval(function(){
	      if (i > stop){
	        return;
	      }
	      $('#len'+(i++)).toggleClass('bounce');
	    }, 500)
	  });
	});


});
$(document).on('turbolinks:load', function(){
	$('.click-in-book').on('click', function(){
		var book_id = $(this).data('id');
		var count_view = parseInt($('#count-view-'+book_id).val());
		$.ajax({
			url: '/books/' + book_id,
			method: 'PUT',
			dataType: 'json',
			data: {
				authenticity_token: $('[name="csrf-token"]')[0].content,
				count_view: count_view += 1
			},
			success: function(data){
				debugger
				$('#count-view-'+book_id).replaceWith(data.data_view)
			} 
		})
	})

	$('.click-in-all-book').on('click', function(){
		var book_id = $(this).data('id');
		var count_view = parseInt($('#count-view-all-'+book_id).val());
		$.ajax({
			url: '/books/' + book_id,
			method: 'PUT',
			dataType: 'json',
			data: {
				authenticity_token: $('[name="csrf-token"]')[0].content,
				count_view: count_view += 1
			},
			success: function(data){
				debugger
				$('#countall-view-'+book_id).replaceWith(data.data_view)
			} 
		})
	})

	$('.click-in-full-book').on('click', function(){
		var book_id = $(this).data('id');
		var count_view = parseInt($('#count-view-full-'+book_id).val());
		$.ajax({
			url: '/books/' + book_id,
			method: 'PUT',
			dataType: 'json',
			data: {
				authenticity_token: $('[name="csrf-token"]')[0].content,
				count_view: count_view += 1
			},
			success: function(data){
				debugger
				$('#countfull-view-'+book_id).replaceWith(data.data_view)
			} 
		})
	})
	
});
