<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="area-floating">
    <span class="btn-topancher"><button><svg data-v-6674f362="" data-v-7f8c71ce="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" id="fab-top-move" mode="" style="box-shadow: rgba(0, 0, 0, 0.2) 0px 2px 4px; border-radius: 50%;"><g fill="none" fill-rule="evenodd" stroke="#555"><circle cx="25" cy="25" r="24.5" fill="#FFF" fill-opacity=".7"></circle><g stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path d="M31.52 21.997l-5.997-5.998-5.998 5.998M25.523 35.044V16"></path></g></g></svg></button></span>
    <%--
    <c:if test="${comonLatelyBasicProductCount gt 0 and not fn:contains(pageContext.request.requestURI, '/introductionView')}">
        <span class="btn-favview"><button onclick="$.requestPage($.action.common.search.list(), {latelyYn : 'Y'});">최근 본 상품</button></span>
    </c:if>
     --%>
    <c:if test="${not fn:contains(pageContext.request.requestURI, '/introductionView') }">
        <span class="btn-chatbot"><button onclick="javascript:happytalk.open();">상담하기</button></span>
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
