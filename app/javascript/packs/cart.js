$(document).on('turbolinks:load', function(){
		var quantity = 1
		$('#add').click(function(){
			quantity = quantity += 1;
			$("#result_quantity").val(quantity) 
		});
		$('#reduce').click(function(){
			if (quantity > 1){
				quantity = quantity -= 1 
			}
			$("#result_quantity").val(quantity);
		});
	
  })
$(document).ready(function(){

	$(document).on('click', '.button-cart', function(){
		var booksale_id = $("#booksale_id").val();
		var cart_id = $('#cart_id').val();
	    $.ajax({
	      url: '/carts/'+ cart_id,
	      data: {
	              authenticity_token: $('[name="csrf-token"]')[0].content,
	              quantity: $("#result_quantity").val(),
	              booksale_id: booksale_id
	          },
	          datatype: "json",
	          type: 'patch',
	          error: function(){ 
	              alert('xin mời login');
	          },
	          success : function(data) { 
	              if(!data.success&& !data.quantity){
	                $("#notice-select").html(data.errors[0].message); 
	    
	              } else if(data.success){
	                
	                alert('them vao gio hang thanh cong');
	              }
	          } 
	    })
	})    
})



$(document).on('turbolinks:load', function(){
  
    const formatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'VND',
    minimumFractionDigits: 2
  })

  $(".add-key").click(function(){
 
  var iddetail = $(this).data('iddetail');
    var price = parseInt(document.getElementById("unit-price-" + iddetail).innerHTML);
    var a = parseInt($(".quantity-"+iddetail).val());
    
    a += 1;
    var total = a*price;
    $(".quantity-"+ iddetail).val(a);
    document.getElementById("cart_total_price-" + iddetail).innerHTML= formatter.format(a*price);
  });


  $(".minus-key").click(function(){

  var iddetail = $(this).data('iddetail');
    var price = parseInt(document.getElementById("unit-price-" + iddetail).innerHTML);
    var a = parseInt($(".quantity-"+ iddetail).val());
    if(a >1){
      a -= 1;
      $(".quantity-"+ iddetail).val(a);

    }
     document.getElementById("cart_total_price-" + iddetail).innerHTML= formatter.format(a*price);
  });
  

});

$(document).on('turbolinks:load', function(){
  $(".delete-product").click(function(){
    var id = $(this).data('id');
    var booksale_id = $(this).data('booksale');
    $.ajax({

      url: '/carts/'+id ,
      type: 'DELETE',
      data: {
         authenticity_token: $('[name="csrf-token"]')[0].content,
        _method: 'DELETE',
        booksale_id: booksale_id
        
      },
      success: function(data) {
        $(".xoa-"+booksale_id).remove();
        alert('xoa thanh cong');
      }  
    
    });
  });
});



$(document).on('turbolinks:load', function(){

  const formatter = new Intl.NumberFormat('VN', {
    style: 'currency',
    currency: 'VND',
    minimumFractionDigits: 3
  })
  $( ".add-key" ).mouseout(function() {
    var id = $('#id-of-current_cart').val();
    var iddetail = $(this).data('iddetail');
  
     $.ajax({
        url: '/carts/'+id,
        data: {

            authenticity_token: $('[name="csrf-token"]')[0].content,
            quantity: $(".quantity-"+iddetail).val(),
            cart_identy: 1,
            booksale_id: iddetail
        },
        datatype: "json",
        type: 'put',
      
        success: function(data) {
                $(".quantity-"+iddetail).html(data.quantity);
        }  
       
      });
  });


  $( ".minus-key" ).mouseout(function() {
    debugger
    var id = $('#id-of-current_cart').val();
    var booksale_id = $(this).data('iddetail');
  
     $.ajax({
        url: '/carts/'+id,
        data: {

            authenticity_token: $('[name="csrf-token"]')[0].content,
            quantity: $(".quantity-"+booksale_id).val(),
            cart_identy: 1,
         	booksale_id: booksale_id
        },
        datatype: "json",
        type: 'put',
      
        success : function(data) {
                $(".quantity-"+iddetail).html();
        }  
       
      });
  });

});


  $(document).on('turbolinks:load', function(){
    $(".dia_chi").click(function(){

        $("#add-login").click();
    });
  });
