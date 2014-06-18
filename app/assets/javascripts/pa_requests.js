$(function () {
  var options = {
    apiId: '1vd9o4427lyi0ccb2uem',
    version: 1,
  };


  var form_options = {
    apiId: '1vd9o4427lyi0ccb2uem',
    version: 1,
    drugId: eval($('#drug_number').val()) || eval(''),
    state: eval("'"+$('#pa_request_state').val()+"'") || eval('')
  };
  $('#pa_request_form_id').formSearch(form_options);

  var dashboard_options = {
    apiId: '1vd9o4427lyi0ccb2uem',
    version: 1,
    tokenIds: eval($('meta[name=tokens]').attr('content')) || eval([ ])
  };
  $('#dashboard').dashboard(dashboard_options);


  $('#new_pa_request').submit(function(event) {
    var $form = $(this);

    var create_options = {
      apiId: options.apiId,
      version: options.version,
      data: {
        request: {
          state: $('#pa_request_state').val(),
          urgent: $('#pa_request_urgent').val(),
          form_id: $('#pa_request_form_id').val(),
          patient: {
            first_name: $('#patient_first_name').val(),
            last_name: $('#patient_last_name').val(),
            date_of_birth: $('#date_of_birth').val()
          },
          prescription: {
            drug_id: $('#drug_number').val(),
            name: $('#drug_name').val(),
            refills: $('#prescription_refills').val(),
            quantity: $('#prescription_quantity').val(),
            frequency: $('#prescription_frequency').val(),
            dispense_as_written: $('#prescription_dispense_as_written').val()
          }
        }
      },
      success: function(request, status, xhr) {
        // this function is called after the createRequest call below
        // use the first token as the one we save in the form
        var token = request.tokens[0].id;
        var link = request.html_url;
        var id = request.id;
        if (status === "success") {
          $form.append($('<input type="hidden" name="pa_request[sent]" />').val(0));
          $form.append($('<input type="checkbox" checked="checked" id="pa_request_sent" name="pa_request[sent]" />').val(1));
          $form.append($('<input type="hidden" name="pa_request[cmm_token]" />').val(token));
          $form.append($('<input type="hidden" name="pa_request[cmm_link]" />').val(link));
          $form.append($('<input type="hidden" name="pa_request[cmm_id]" />').val(id));
          $form.get(0).submit();
        }
      },
      error: function(response, status, xhr) {
        var error = response.responseJSON.errors[0];
          console.log('code: '+error.code);
          console.log('message '+error.message);
      }
    };


     // call out to the CMM service
     $.ajax({
          url:  'https://api.covermymeds.com/requests?v=1',
          type: 'POST',
          beforeSend: function (xhr, settings) {
              if (!options.url) {
                  xhr.setRequestHeader('Authorization', 'Basic ' + Base64.encode(options.apiId + ':x-no-pass'));
              }
          },
          success: function (data, status, xhr) {
              // Run user-defined callback
              if (typeof create_options.success === 'function') {
                create_options.success(data.request, status, xhr);
              }
          },
          error: function (data, status, xhr) {
              // Run user-defined callback
              if (typeof create_options.error === 'function') {
                  create_options.error(data, status, xhr);
              }
          },
          data: create_options.data
      });

      // Prevent the form from submitting with the default action
      return false;
    });


});