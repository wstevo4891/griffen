var $radioLabel = $('.radio-row label');

var $phoneLabel = $('.phone-line label');

enquire.register("screen and (max-width: 480px)", {
    match: function() {
        $radioLabel.removeClass('radio-inline').addClass('radio');
        $phoneLabel.removeClass('radio-inline').addClass('radio');
    },

    unmatch: function() {
        $radioLabel.removeClass('radio').addClass('radio-inline');
        $phoneLabel.removeClass('radio').addClass('radio-inline');
    }
}).listen();