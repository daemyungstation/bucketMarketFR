<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="<spring:eval expression="@resource['kakao.api.url']"/>"></script>
<script src="<spring:eval expression="@resource['daum.zipcode.api.url' ]"/>"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/clipboard/clipboard.min.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/validate/jquery.validate.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/loading.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/jquery.ajax.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/jquery.common.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/jquery.lazy.min.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/common.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/front.action.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/sns.share.js"></script>
<script>
$(function () {
    // var $snsMeta = $("head").find("meta[class='meta-sns-share']");
    //if ($snsMeta.length > 0) {
        //console.log("kakao.init")        
        Kakao.init("<spring:eval expression="@resource['kakao.api.javascript.key']"/>");
    //}
})
</script>