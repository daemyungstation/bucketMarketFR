<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<!-- Global site tag (gtag.js) - Google Ads: 373090178 -->
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-373090178"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'AW-373090178');
</script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">

<c:if test="${seoMeta[0] != null}">
<title><c:out value="${seoMeta[0]}"/></title>
<meta property="og:title" content="<c:out value="${seoMeta[0]}"/>">
</c:if>
<c:if test="${seoMeta[0] == null}">
<title><spring:eval expression="@resource['project.title']"/></title>
<meta property="og:title" content="<spring:eval expression="@resource['project.title']"/>">
</c:if>

<c:if test="${seoMeta[1] != null}">
<meta name="description" content="<c:out value="${seoMeta[1]}"/>">
<meta property="og:description" key="description" content="<c:out value="${seoMeta[1]}"/>"/>
</c:if>
<c:if test="${seoMeta[1] == null}">
<meta name="description" content="꿈꾸던 삶을 담다.생활혜택 지원으로 일상의 부담은 덜고 맞춤 라이프 서비스로 미래를 준비합니다.">
<meta property="og:description" key="description" content="꿈꾸던 삶을 담다.생활혜택 지원으로 일상의 부담은 덜고 맞춤 라이프 서비스로 미래를 준비합니다."/>
</c:if>

<c:if test="${seoMeta[2] != null}">
<meta name="keyword" content="<c:out value="${seoMeta[2]}"/>">
</c:if>
<c:if test="${seoMeta[2] == null}">
<meta name="keyword" content="버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓방법,버킷마켓후기">
</c:if>

<meta name="robots" content="index,follow">
<meta name="facebook-domain-verification" content="8bc5vlhjr7zdrzgjp0ykldrb7n03mw" />
<meta name="_csrf_name" content="<c:out value="${_csrf.parameterName}"/>" class="csrf-name">
<meta name="_csrf_token" content="<c:out value="${_csrf.token}"/>" class="csrf-token">
<meta name="_csrf_header" content="<c:out value="${_csrf.headerName}"/>" class="csrf-header"/>

<link rel="shortcut icon" href="/resources/mo/images/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/common.css">
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/lib.css">
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/mo/js/lib.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/mo/js/style.js"></script>
<link rel="shortcut icon" href="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/favicon.ico" type="image/x-icon" />
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

<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-PDDWT2X');</script>
<!-- End Google Tag Manager -->

<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '347487896509803');
fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=347487896509803&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->


<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script> 
<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_dc9b7bfbb6d";
if (!_nasa) var _nasa={};
wcs.inflow();
wcs_do(_nasa);
</script>

