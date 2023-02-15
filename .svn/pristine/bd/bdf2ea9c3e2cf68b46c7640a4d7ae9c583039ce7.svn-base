<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
    <%@ include file="/WEB-INF/jsp/mo/include/head.jsp"%>
</head>
<body style="background:#000;">
    <%@ include file="/WEB-INF/jsp/common/include/loading.jsp"%>
    <%@ include file="/WEB-INF/jsp/mo/include/script.jsp"%>
    
    <form name="joinStepForm" id="joinStepForm">
        <input type="hidden" name="PRD_MST_NO" value="<c:out value="${commandMap.PRD_MST_NO }"/>"/>
        <c:if test="${info.PRD_MST_OPT_YN eq 'Y' }">
            <c:forEach var="PRD_OPT_IDX" items="${commandMap.PRD_OPT_IDXs }">
                <input type="hidden" name="PRD_OPT_IDXs" value="<c:out value="${PRD_OPT_IDX }"/>"/>
            </c:forEach>
        </c:if>
        <input type="hidden" name="ORD_MST_CNT" value="<c:out value="${commandMap.ORD_MST_CNT }"/>"/>
    </form>
    
    <script>
    $(function () {
        var $joinStepForm = $("#joinStepForm");
        
        <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
        $.ajax({
            url : "https://mobile.midas-i.com/roianal.mezzo/tracking?cmp_no=2212&depth=3",
            dataType : "jsonp",
            async : true, 
            timeout: 500,
            success: function(data) { $.requestPage($.action.contract.join.step3.form(), $joinStepForm.serializeObject()); }, 
            error : function(e) { $.requestPage($.action.contract.join.step3.form(), $joinStepForm.serializeObject()); }
        });
        
        </c:if>
        
        <c:if test="${info.PRD_MST_TYPE ne Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
        $.postSyncJsonAjax($.action.contract.join.data.exists.ajax(), null, function (data) {
            if (data.isLogin && data.isDataExists) {
                var _nao={};
                _nao["cnv"] = wcs.cnv("5","1000");
                wcs_do(_nao);
                
                $.ajax({
                    url : "https://mobile.midas-i.com/roianal.mezzo/tracking?cmp_no=2212&depth=3",
                    dataType : "jsonp",
                    async : true, 
                    timeout: 500,
                    success: function(data) { $joinStepForm.postSubmit($.action.contract.join.regist()); }, 
                    error : function(e) { $joinStepForm.postSubmit($.action.contract.join.regist()); }
                });
                
            } else {
                $joinStepForm.getSubmit($.action.contract.join.step1.form());
            }
        });
        </c:if>
    });
    </script>
</body>
</html>