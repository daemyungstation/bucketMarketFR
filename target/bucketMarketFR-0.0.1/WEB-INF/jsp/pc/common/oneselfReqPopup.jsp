<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
    <%@ include file="/WEB-INF/jsp/pc/include/head.jsp"%>
</head>
<body style="background:#000;">
    <%@ include file="/WEB-INF/jsp/common/include/loading.jsp"%>
    <%@ include file="/WEB-INF/jsp/pc/include/script.jsp"%>
    <form name="oneselfForm" id="oneselfForm">
        <input type="hidden" name="reqInfo" value=""/>
        <input type="hidden" name="retUrl" value=""/>
        <input type="hidden" name="verSion" value="2"/>
    </form>
    <script>
        $(function () {
            var $oneselfForm = $("#oneselfForm");
            var params = {
                reqNum : "<c:out value="${commandMap.reqNum }"/>",
                addVar : "<c:out value="${commandMap.addVar }"/>" 
            };
            $.postSyncJsonAjax($.action.common.oneself.req.ajax(), params, function (data) {
                params = data.params;
                $oneselfForm.find("input[name='reqInfo']").val(params.reqInfo);
                $oneselfForm.find("input[name='retUrl']").val("32" + params.retUrl);
                $oneselfForm.postSubmit(params.reqUrl);
            });
        });
    </script>
</body>
</html>