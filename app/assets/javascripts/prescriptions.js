$(function () {
  var options = {
    apiId: 'd895441311099b4f52cb',
    version: 1
  };

  $('#prescription_drug_number').drugSearch(options);

  $('#prescription_drug_number').change(function() {
    $('#prescription_drug_name').val($('#prescription_drug_number').select2('data').text);
  });

});