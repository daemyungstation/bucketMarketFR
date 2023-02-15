<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta property="og:url" content="<spring:eval expression="@resource['front.ssl.domain']"/>/">
<meta property="og:title" content="<spring:eval expression="@resource['project.title']"/>">
<meta property="og:type" content="website">
<meta property="og:image" key="image" content="<spring:eval expression="@resource['front.ssl.domain']"/>/resources/mo/images/preview.png"/>
<meta property="og:description" key="description" content="버킷마켓 - 꿈꾸던 삶을 담다."/>
<meta name="_csrf_name" content="<c:out value="${_csrf.parameterName}"/>" class="csrf-name">
<meta name="_csrf_token" content="<c:out value="${_csrf.token}"/>" class="csrf-token">
<meta name="_csrf_header" content="<c:out value="${_csrf.headerName}"/>" class="csrf-header"/>
<title><spring:eval expression="@resource['project.title']"/></title>
<link rel="shortcut icon" href="/resources/pc/images/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/common.css" >
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/lib.css">
<script type="text/javascript" src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/pc/js/lib.js"></script>
<script type="text/javascript" src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/pc/js/style.js"></script>
<link rel="shortcut icon" href="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/favicon.ico" type="image/x-icon" />
<script>
$.resources = {
    domain : {
        server : "",
        cdn : "<spring:eval expression="@resource['cdn.ssl.domain']"/>",
        img : "<spring:eval expression="@resource['cdn.ssl.domain']"/>",
        front : "<spring:eval expression="@resource['front.ssl.domain']"/>",
        mobile : "<spring:eval expression="@resource['mobile.ssl.domain']"/>"
    },
    url : {
        list : "<spring:eval expression="@url['common.url.list.ajax']"/>"
    },
    device : "<c:out value="${device }"/>",
    isPc : <c:out value="${device eq Const.PC }"/>,
    isMobile : <c:out value="${device eq Const.MOBILE }"/>,
    isApp : <c:out value="${device eq Const.APP }"/>,
    isAndroid : <c:out value="${deviceOs eq Const.OS_APP_ANDROID }"/>,
    isIos : <c:out value="${deviceOs eq Const.OS_APP_IOS }"/>,
    isUserLogin : <c:out value="${not empty isUserLogin ? isUserLogin : false }"/>,
    isPlannerLogin : <c:out value="${not empty isPlannerLogin ? isPlannerLogin : false}"/>,
    linkTarget : {
        none : "<c:out value="${Const.LINK_TARGET_NONE }"/>",
        href : "<c:out value="${Const.LINK_TARGET_HREF }"/>",
        window : "<c:out value="${Const.LINK_TARGET_WINDOW }"/>"
    }
};
</script>
<%-- Global site tag (gtag.js) - Google Analytics --%>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-168559290-1"></script>
<script>  
    window.dataLayer = window.dataLayer || [];  
    function gtag(){dataLayer.push(arguments);}  
    gtag('js', new Date());  
    gtag('config', 'UA-168559290-1');
</script>