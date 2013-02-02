var friends;
$(function() {
    return $('#search_form').on('ajax:complete', function(event, data, status) {
        var response;
        response = $.parseJSON(data.responseText);
        friends  = response.friends
    });
});
