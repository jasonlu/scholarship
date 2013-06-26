

$(document).ajaxStop($.unblockUI); 
$(document).ready(function(){
  defaultAudioFile = $('.course_item dd').eq(0).data('audio-url');
  jwplayer("audio_player").setup({
    file: defaultAudioFile,
    flashplayer: 'swfs/jwplayer.flash.swf',
    autostart: false,
    width: '100%',
    height: 30
  });


  $('.course_item').first().fadeIn(1000).addClass('current').find('.btn-previous').addClass('disabled');
  $('.course_item').last().find('.btn-next').addClass('disabled');
  $('.btn-next').click(function(){
    if($(this).hasClass('disabled')) {
      return false;
    }
    showItem('next');
  });


  $('.btn-previous').click(function(){
    if($(this).hasClass('disabled')) {
      return false;
    }
    showItem('prev');
  });

  $('.btn-play').click(function(){
    jwplayer().play();
  });

  function showItem(direction) {

    thisElement = $('.current').eq(0);

    if(direction == 'next') {
      nextElement = thisElement.next('.course_item').eq(0);
    } else {
      nextElement = thisElement.prev('.course_item').eq(0);
    }
    if(nextElement.length == 0) {
      return false;
    }
    
    thisElement.removeClass('current').fadeOut(100, function(){
      nextElement.fadeIn(1000).addClass('current');
      defaultAudioFile = nextElement.find('dd').eq(0).data('audio-url');
      jwplayer().load([{file:defaultAudioFile}]);
    });
  }
});

