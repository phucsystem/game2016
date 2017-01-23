$(document).ready(function () {
    // init validation engine
    $("#login-form").validationEngine('attach', {
        promptPosition: "centerRight",
        scroll: true
    });

    // init tool tip lib
    $('[title]').qtip(
    {
        position: {
            my: 'top left', // Position my top left...
            at: 'bottom right', // at the bottom right of...
            target: $('[title]') // my target
        },
        style: {
            classes: 'tooltipClass'
        }
    });



$(window).bind("load resize", function() {
    topOffset = 0;
    width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
    height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
    height = height - topOffset;
    if (height < 1) height = 1;
    if (height > topOffset) {
        // $("#page-wrapper").css("min-height", (height) + "px");
        $('body').css("min-height", height + "px");
        $('body').css('background-size', '100%');
    }
});

});

var validateLogin = function () {
    $("#formID1").validationEngine('validate');
}


