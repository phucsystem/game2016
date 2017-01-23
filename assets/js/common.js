// Declare common function
var common = function () {
};

common.centerModal = function () {
    $(this).css('display', 'block');
    var $dialog = $(this).find(".modal-dialog"),
            offset = ($(window).height() - $dialog.height()) / 2,
            bottomMargin = parseInt($dialog.css('marginBottom'), 10);

    // Make sure you don't hide the top part of the modal w/ a negative margin if it's longer than the screen height, and keep the margin equal to the bottom margin of the modal
    if (offset < bottomMargin)
        offset = bottomMargin;
    $dialog.css("margin-top", offset);
};


common.confirmDialog = function (message, callbackFnc) {
    bootbox.confirm({
        title: "Confirmation",
        size: 'medium',
        message: message,
        callback: function (result) {
            if (result == true) {
                callbackFnc();
            }
        }
    });
};

common.alertDialog = function (message) {
    bootbox.alert({
        title: "Alert",
        size: 'medium',
        message: message
    });
};

common.showNotify = function (message) {
    {
        $.notify({
            // options
            message: message
        }, {
            // settings
            type: 'info',
            placement: {
                from: "top",
                align: "center"
            },
            delay: 1000,
            animate: {
                enter: 'animated fadeInDown',
                exit: 'animated fadeOutUp'
            }
        });
    }
};

var pleaseWaitDiv = $("" +
        "<div class='modal' id='lpDialog' data-backdrop='static' data-keyboard='false'>" +
        "<div class='modal-dialog' >" +
        "<div class='modal-content'>" +
        "<div class='modal-header'><b>Processing...</b></div>" +
        "<div class='modal-body'>" +
        "<div class='progress'>" +
        "<div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow='100' aria-valuemin='100' aria-valuemax='100' style='width:100%'> " +
        "Please Wait..." +
        "</div>" +
        "</div>" +
        "</div>" +
        "</div>" +
        "</div>" +
        "</div>");
common.showLoadingModal = function () {
    pleaseWaitDiv.modal();
    common.centerModal();
}

common.closeLoadingModal = function () {
    pleaseWaitDiv.modal('hide');
}

common.initTooltip = function () {
    $('[rel="tooltip"],[data-rel="tooltip"]').tooltip({
        "placement": "bottom",
        delay: {
            show: 400,
            hide: 200
        }
    });
};

common.openWindow = function (url) {
    window.open(url, '', 'height=500,width=800');
}


common.showEvent = function (content) {
    bootbox.dialog({
        title: "Event",
        message: content,
        size: 'large',
    });
}

common.showPrompt = function (selector, content) {
    $(selector).validationEngine('showPrompt', content, 'error', 'topRight', true);
}

common.hidePrompt = function (selector) {
    $(selector).validationEngine('hide');
}