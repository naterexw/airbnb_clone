$(function() {
  // implementation of disabled form fields
  var nowTemp = new Date();
  var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
  var checkin = $('#datepicker-1').fdatepicker({
    format: 'dd-mm-yyyy',
    onRender: function(date) {
      return date.valueOf() < now.valueOf() ? 'disabled' : '';
    }
  }).on('changeDate', function(ev) {
    if (ev.date.valueOf() > checkout.date.valueOf()) {
      var newDate = new Date(ev.date);
      newDate.setDate(newDate.getDate() + 1);
      checkout.update(newDate);
    }
    checkin.hide();
    $('#datepicker-2').prop('disabled', false);
    $('#datepicker-2')[0].focus();
  }).data('datepicker');
  var checkout = $('#datepicker-2').fdatepicker({
    format: 'dd-mm-yyyy',
    onRender: function(date) {
      return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
    }
  }).on('changeDate', function(ev) {
    checkout.hide();
  }).data('datepicker');

  // Preload action AJAX
  // $.ajax({
  //   url: '/preload',
  //   data: {
  //     'room_id':
  //   }
  // })
});
