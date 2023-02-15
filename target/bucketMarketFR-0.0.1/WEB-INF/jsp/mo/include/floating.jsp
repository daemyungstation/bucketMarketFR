<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="area-floating">
    <span class="btn-topancher"><button>TOP</button></span>
    
    <c:if test="${comonLatelyBasicProductCount gt 0 and not fn:contains(pageContext.request.requestURI, '/introductionView')}">
        <span class="btn-favview"><button onclick="$.requestPage($.action.common.search.list(), {latelyYn : 'Y'});">최근 본 상품</button></span>
    </c:if>
    <c:if test="${not fn:contains(pageContext.request.requestURI, '/introductionView') }">
        <span class="btn-chatbot"><button onclick="javascript:happytalk.open();">챗봇</button></span>
    </c:if>
</div>

<script>
    window.__ht_wc = window.__ht_wc || {};
    window.__ht_wc.host = 'design.happytalkio.com';
    window.__ht_wc.site_id = '4000001448'; // site_id
    window.__ht_wc.site_name = '버킷마켓'; // 회사 이름
    window.__ht_wc.category_id = '116511'; // 대분류 id
    window.__ht_wc.division_id = '116512'; // 중분류 id
    // 고정 및  Custom 파라미터 추가영역. 파라미터가 여러개인 경우 ,(콤마)로 구분
    // window.__ht_wc.params = 'site_uid=abcd1234,parameter1=param1';
            
    (function() {
        var ht = document.createElement('script');
        ht.type = 'text/javascript';
        ht.async = true;
        ht.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + window.__ht_wc.host + '/web_chatting/tracking.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ht, s);
    })();
</script>
