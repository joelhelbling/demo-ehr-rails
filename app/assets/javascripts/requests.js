$(function () {
    var options = {
      apiId: '1vd9o4427lyi0ccb2uem',
      version: 1,
    };
    $('#form').formSearch(options);
    $('#drug').drugSearch(options);

    var dashboard_options = {
      apiId: '1vd9o4427lyi0ccb2uem',
      version: 1,
      tokenIds: ['gq9vmqai2mkwewv1y55x', '33lhqakhtmas8r965w39', 's4c85zi3ku0b9re5sg1o']
    };
    $('#dashboard').dashboard(dashboard_options);

  });