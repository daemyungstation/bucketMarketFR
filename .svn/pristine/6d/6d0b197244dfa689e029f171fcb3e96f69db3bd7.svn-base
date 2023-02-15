function Paging () {
    var firstPageLabel = "",
        previousPageLabel = "",
        nextPageLabel = "",
        lastPageLabel = "",
        currentPageLabel = "",
        otherPageLabel = "",
        firstPageLabelDisable = "",
        previousPageLabelDisable = "",
        nextPageLabelDisable = "",
        lastPageLabelDisable = "";
    firstPageLabel = "<button class=\"first paging-button\" data-c_page=\"{0}\">처음으로</button>";
    previousPageLabel = "<button class=\"prev paging-button\" data-c_page=\"{0}\">이전목록</button>";
    nextPageLabel = "<button class=\"next paging-button\" data-c_page=\"{0}\">다음목록</button>";
    lastPageLabel = "<button class=\"last paging-button\" data-c_page=\"{0}\">마지막목록</button>";
    currentPageLabel = "<button class=\"on\" onclick=\"return false;\">{0}</button>";
    otherPageLabel = "<button class=\"paging-button\" data-c_page=\"{0}\">{0}</button>";
    firstPageLabelDisable = "<button class=\"first\" onclick=\"return false;\">처음으로</button>";
    previousPageLabelDisable = "<button class=\"prev\" onclick=\"return false;\">이전목록</button>";
    nextPageLabelDisable = "<button class=\"next\" onclick=\"return false;\">다음목록</button>";
    lastPageLabelDisable = "<button class=\"last\" onclick=\"return false;\">마지막목록</button>";
    this.renderPagination = function (paging) {
        var html = "";
        if (typeof(paging) != "undefined") {
            var firstPageNo = StringUtil.getInt(paging.firstPageNo),
                firstPageNoOnPageList = StringUtil.getInt(paging.firstPageNoOnPageList),
                totalPageCount = StringUtil.getInt(paging.totalPageCount),
                lastPageNoOnPageList = StringUtil.getInt(paging.lastPageNoOnPageList),
                cPage = StringUtil.getInt(paging.cPage),
                lastPageNo = StringUtil.getInt(paging.lastPageNo),
                pageSize = StringUtil.getInt(paging.pageSize),
                pagingSize = StringUtil.getInt(paging.pagingSize);

            lastPageNoOnPageList = (lastPageNoOnPageList > totalPageCount) ? totalPageCount : lastPageNoOnPageList;
            
            if (totalPageCount > pagingSize && firstPageNoOnPageList > pagingSize) {
                html += StringUtil.format(firstPageLabel, firstPageNo);
                html += StringUtil.format(previousPageLabel, (firstPageNoOnPageList - 1));
            } else {
                html += firstPageLabelDisable;
                html += previousPageLabelDisable;
            }
            html += "<span>";
            for (var i = firstPageNoOnPageList; i <= lastPageNoOnPageList; i++) {
                if (i == cPage) {
                    html += StringUtil.format(currentPageLabel, i);
                } else {
                    html += StringUtil.format(otherPageLabel, i);
                }
            }
            html += "</span>";
            if (totalPageCount > pagingSize && lastPageNoOnPageList < totalPageCount) {
                html += StringUtil.format(nextPageLabel, (lastPageNoOnPageList + 1));
                html += StringUtil.format(lastPageLabel, lastPageNo);
            } else {
                html += nextPageLabelDisable;
                html += lastPageLabelDisable;
            }
        }
        return html;
    }
}

var _paging = new Paging();
(function($) {
    $.fn.paging = function(paging, callback) {
        var $wrap = $(this);
        $wrap.empty();
        $wrap.append(_paging.renderPagination(paging));
        $wrap.off("click", ".paging-button").on("click", ".paging-button", function () {
            callback.call(this, StringUtil.getInt($(this).data("c_page")));
        });
    }
})($);