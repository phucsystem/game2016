
//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
var height = 0;

function resetValidateForm() {
    // Validate form
    $(".form-validate").validationEngine('detach');
    $(".form-validate").validationEngine('attach', {
        // promptPosition: "centerRight",
        maxErrorsPerField: 1,
        scroll: false,
        validateNonVisibleFields: true,
        updatePromptsPosition: true,
        onValidationComplete: function (form, status) {
            if (status == true) {
                common.showLoadingModal();
                return true;
            }
        }
    });
}
;

$(function () {
    $(window).bind("load resize", function () {
        topOffset = 50;
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.navbar-collapse').addClass('collapse');
            topOffset = 100; // 2-row-menu
        } else {
            $('div.navbar-collapse').removeClass('collapse');
        }

        height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
        height = height - topOffset;
        if (height < 1)
            height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height) + "px");
        }
        $('.scroll-div').slimScroll({
            height: height + 'px'
        });
    });

    var url = window.location;
    var element = $('ul.nav a').filter(function () {
        return this.href == url || url.href.indexOf(this.href) == 0;
    }).addClass('active').parent().parent().addClass('in').parent();
    if (element.is('li')) {
        element.addClass('active');
    }

    resetValidateForm();

    $('.datatable').DataTable({
        responsive: true,
        "order": [[0, "desc"]]
    });


    $('[data-toggle="tooltip"]').tooltip();

    $('.scroll-div').slimScroll({
        height: '500px'
    });

    // init select2 component
    function formatTemplate(state) {
        if (!state.id) {
            return state.text;
        }
        var $state = $(
                '<span><img src="' + state.element.attributes.image.nodeValue + '" class="img-component" /> ' + state.text + '</span>'
                );
        return $state;
    }
    ;

    $(".custom-select").select2({
        templateResult: formatTemplate,
        minimumResultsForSearch: Infinity
    });

});
