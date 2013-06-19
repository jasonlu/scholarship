$(document).ajaxStop($.unblockUI); 
$(document).ready(function(){
  $('a.add-to-cart').click(function(){
    $.blockUI({ message: '<h1> </h1>' }); 
    var thisId = $(this).data('id');
    $(this).attr('disabled', true).removeClass('add-to-cart').unbind('click');
    
    $.post('/cart/add.json', {id: thisId}, function(res){
      console.log(res);
    }, 'json');
  });
});