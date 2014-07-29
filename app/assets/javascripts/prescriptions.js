$(function () {
  var options = window.config;

  $('#prescription_drug_number').drugSearch(options);

  $('#prescription_drug_number').change(function() {
    $('#prescription_drug_name').val($('#prescription_drug_number').select2('data').text);
  });

});