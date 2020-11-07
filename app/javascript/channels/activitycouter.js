$(document).ready(function()
{
(function() {
	  App.activities = App.cable.subscriptions.create({
        channel: 'activitiesChannel'
      },
     
       update_counter: function(counter) {
          debugger
          var $counter, val;
          $counter = $('#activity-counter');
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
    
})