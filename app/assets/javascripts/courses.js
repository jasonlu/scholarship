$(document).ready(function(){
  $('a.add-to-cart').click(function(){
    var thisId = $(this).data('id');
    $.post('/cart/add.json', {id: thisId}, function(res){
      console.log(res);
    }, 'json');
  });
});