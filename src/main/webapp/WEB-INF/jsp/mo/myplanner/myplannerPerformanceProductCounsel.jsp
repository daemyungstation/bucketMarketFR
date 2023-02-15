<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">상담현황</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    
    
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">
    
            <!-- 팝업본문 -->
            <div class="box-tab-body tab3 on">
                <div class="box-reward-inner">
                    <div class="box-scroll-table table-type3">
                        <table>
                            <colgroup>
                                <col style="width: 100px;" />
                                <col style="width: 500px;" />
                                <col style="width: 100px;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>상담사</th>
                                    <th>상담내용</th>
                                    <th>등록시간</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty list}">
                                        <c:forEach var="row" items="${list }" varStatus="i">
                                            <tr>
                                                <td>
                                                    <c:out value="${row.ACTP_ID }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.COUNSELL_MEMO }" />
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.REG_DM }" pattern="yyyy.MM.dd HH:MM:SS"/>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="3">상담내역이 없습니다.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- //팝업본문 -->                
        </div>
    </div>
    <!-- //본문 -->

