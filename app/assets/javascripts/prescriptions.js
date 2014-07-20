$(function () {
  var options = {
    apiId: '1vd9o4427lyi0ccb2uem',
    version: 1
  };

  $('#prescription_drug_number').drugSearch(options);

  $('#prescription_drug_number').change(function() {
    $('#prescription_drug_name').val($('#prescription_drug_number').select2('data').text);
  });

});