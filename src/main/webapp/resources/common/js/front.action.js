(function($) {
    $.fn.extend(jQuery, {
        action : {}
    });
})(jQuery);
function FRAction () {
    var FRAction = this;
    FRAction.init = function () {
        var requestUrl = $.resources.domain.server;
        requestUrl += $.resources.url.list;
        $.postSyncJsonAjax(requestUrl, {}, function (data) {
            $.each(data.list, function (i, row) {
                $.action.data = data.list;
                $.each(row, function (key, value) {
                    FRAction.setAction(key.substring(0, key.indexOf(".")), key.substring(key.indexOf(".") + 1, key.length), $.resources.domain.server + value);
                });
            });
        });
    }
    FRAction.setAction = function (a, b, c) {
        if (typeof(eval("$.action." + a)) != "undefined") {
            if (b.indexOf(".") > -1) {
                FRAction.setAction(a + "." + b.substring(0, b.indexOf(".")), b.substring(b.indexOf(".") + 1, b.length), c);
            } else {
                if (b != "") {
                    FRAction.setAction(a + "." + b, "", c);
                }
            }
        } else {
            if (b.indexOf(".") > -1) {
                eval("$.action." + a + " = {};");
                FRAction.setAction(a + "." + b.substring(0, b.indexOf(".")), b.substring(b.indexOf(".") + 1, b.length), c);
            } else {
                if (b != "") {
                    eval("$.action." + a + " = {};");
                    FRAction.setAction(a + "." + b, "", c);
                } else {
                    eval("$.action." + a + " = function () { return '" + c + "'; }");
                }
            }
        }
    }
    FRAction.init();
}
$(function () {
    new FRAction();
});