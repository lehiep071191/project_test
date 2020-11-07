$(document).ready(function()
{
(function() {
      App.comments = App.cable.subscriptions.create({
        channel: 'commentsChannel'
      },
      {
        connected: function() {},
        disconnected: function() {},
        received: function(data) {
          $('#commentList').prepend('' + data.comment);
          $('#commentList li').click(function(){
            window.location.href = $(this).find('a').first().attr('href');
          });

          return this.update_counter(data.counter);
        },
        update_counter: function(counter) {
          debugger
          var $counter, val;
          $counter = $('#comment-counter');
          val = parseInt($counter.text());
          val++;
          return $counter.css({
            opacity: 0
          }).text(val)
            .css({
              top: '-10px'
            })
            .transition({
              top: '10px',
              opacity: 1
            });
        }
      });
  }).call(this);
}
