package common.util.renderer;

import java.text.MessageFormat;

import common.model.Paging;

/**
 * @Class Name : PagingRenderer 기본적인 페이징 기능이 구현되어 있으며, 화면에서 아래와 같이 display 된다.
 *
 *        [<<][<] 1 2 3 4 5 6 7 8 [>][>>]
 *
 *        firstPageLabel = [<<] previousPageLabel = [<] currentPageLabel = 현재
 *        페이지 번호 otherPageLabel = 현재 페이지를 제외한 페이지 번호 nextPageLabel = [>]
 *        lastPageLabel = [>>]
 *
 */
public class PagingRenderer {
    public String firstPageLabel;
    public String previousPageLabel;
    public String currentPageLabel;
    public String otherPageLabel;
    public String nextPageLabel;
    public String lastPageLabel;
    public String firstPageLabelDisable;
    public String previousPageLabelDisable;
    public String nextPageLabelDisable;
    public String lastPageLabelDisable;

    public PagingRenderer() {
        firstPageLabel = "<button class=\"first\" onclick=\"{0}({1}); return false;\">처음으로</button>";
        previousPageLabel = "<button class=\"prev\" onclick=\"{0}({1}); return false;\">이전목록</button>";
        nextPageLabel = "<button class=\"next\" onclick=\"{0}({1}); return false;\">다음목록</button>";
        lastPageLabel = "<button class=\"last\" onclick=\"{0}({1}); return false;\">마지막목록</button>";
        currentPageLabel = "<button class=\"on\" onclick=\"return false;\">{0}</button>";
        otherPageLabel = "<button onclick=\"{0}({1}); return false;\">{1}</button>";
        firstPageLabelDisable = "<button class=\"first\" onclick=\"return false;\">처음으로</button>";
        previousPageLabelDisable = "<button class=\"prev\" onclick=\"return false;\">이전목록</button>";
        nextPageLabelDisable = "<button class=\"next\" onclick=\"return false;\">다음목록</button>";
        lastPageLabelDisable = "<button class=\"last\" onclick=\"return false;\">마지막목록</button>";
    }

    @SuppressWarnings("unused")
    public String renderPagination(Paging paging, String jsFunction) {
        StringBuffer strBuff = new StringBuffer();
        if (paging != null) {
            
            int firstPageNo = paging.getFirstPageNo();
            int firstPageNoOnPageList = paging.getFirstPageNoOnPageList();
            int totalPageCount = paging.getTotalPageCount();
            int lastPageNoOnPageList = paging.getLastPageNoOnPageList();
            int cPage = paging.getcPage();
            int lastPageNo = paging.getLastPageNo();
            int pageSize = paging.getPageSize();
            int pagingSize = paging.getPagingSize();

            if (totalPageCount > pagingSize) {
                if (firstPageNoOnPageList > pagingSize) {
                    strBuff.append(MessageFormat.format(firstPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNo) }));
                    strBuff.append(MessageFormat.format(previousPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNoOnPageList - 1) }));
                } else {
                    strBuff.append(firstPageLabelDisable);
                    strBuff.append(previousPageLabelDisable);
                }
            } else {
                strBuff.append(firstPageLabelDisable);
                strBuff.append(previousPageLabelDisable);
            }

            if (lastPageNoOnPageList > totalPageCount) {
                lastPageNoOnPageList = totalPageCount;
            }
            strBuff.append("<span>");
            for (int i = firstPageNoOnPageList; i <= lastPageNoOnPageList; i++) {
                if (i == cPage) {
                    strBuff.append(MessageFormat.format(currentPageLabel, new Object[] { Integer.toString(i) }));
                } else {
                    strBuff.append(MessageFormat.format(otherPageLabel, new Object[] { jsFunction, Integer.toString(i), Integer.toString(i) }));
                }
            }
            strBuff.append("</span>");
            if (totalPageCount > pagingSize) {
                if (lastPageNoOnPageList < totalPageCount) {
                    strBuff.append(MessageFormat.format(nextPageLabel, new Object[] { jsFunction, Integer.toString(lastPageNoOnPageList + 1) }));
                    strBuff.append(MessageFormat.format(lastPageLabel, new Object[] { jsFunction, Integer.toString(lastPageNo) }));
                } else {
                    strBuff.append(nextPageLabelDisable);
                    strBuff.append(lastPageLabelDisable);
                }
            } else {
                strBuff.append(nextPageLabelDisable);
                strBuff.append(lastPageLabelDisable);
            }
        }
        return strBuff.toString();
    }
}
