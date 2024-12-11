<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>입국자 목록 관리</title>
    <link rel="stylesheet" href="<c:url value='/css/List.css'/>">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="MotherDiv">
    <div class="TitleDiv">입국자 목록 관리</div>
    <div class="BodyDiv">
        <div class="SearchDiv">
            <div class="SearchTitile">고급 검색</div>
            <div class="SearchInputDiv">
                <form method="get" action="<c:url value='/list'/>" style="display:flex;align-items:center;">
                    <input class="SearchInput" type="text" placeholder="이름으로 검색" name="nameSearch" value="${nameSearch}"/>
                    <input class="SearchInput" type="text" placeholder="항공편명으로 검색" name="codeSearch" value="${codeSearch}"/>
                    <input class="SearchInput" type="text" placeholder="출발지로 검색" name="depSearch" value="${depSearch}"/>
                    <button type="submit" style="border-radius:10px;margin-right:5px;">
                        <img src="<c:url value='/image/search.png'/>" alt="search" width="20"/>
                    </button>
                    <a href="<c:url value='/list'/>" style="text-decoration:none;">
                        <button type="button"
                                style="border-radius:10px;font-size:20px;font-weight:700;">
                            초기화
                        </button>
                    </a>
                </form>
            </div>
        </div>
        <div style="font-size:18px;color:#B9B9B9;padding-bottom:10px;box-sizing:border-box;border-bottom:2px solid #DFDFDF;">
            총 <span style="font-size:23px;font-weight:900;color:#070707;">${totalCount}</span>명 |
            의심 <span style="font-weight:900;color:#070707;">${suspectedCount}</span>
        </div>

        <table>
            <thead>
            <tr>
                <th>순번</th>
                <th>분류</th>
                <th>이름</th>
                <th>성별</th>
                <th>생년월일</th>
                <th>항공편명</th>
                <th>출발지</th>
                <th>연락처</th>
                <th>옵션</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${fn:length(currentUsers) == 0}">
                    <tr>
                        <td colspan="9" style="text-align:center;">일치하는 결과가 없습니다.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="data" items="${currentUsers}" varStatus="status">
                        <c:set var="symptom" value="${data.symptom}" />
                        <tr>
                            <td>${(currentPage - 1)*10 + status.index + 1}</td>
                            <td>
                                <c:if test="${symptom != null and fn:length(symptom) > 0}">
                                    의심
                                </c:if>
                            </td>
                            <td>${data.name}</td>
                            <td>${data.gender}</td>
                            <td>${data.birthdate}</td>
                            <td>${data.flightCode}</td>
                            <td>${data.departure}</td>
                            <td>${data.contact}</td>
                            <td>
                                <a href="<c:url value='/edit/${data.id}'/>" style="margin:0px 5px;display:inline-block;">
                                    <button type="button"
                                            style="background-color:white;border:1px solid #B5D3F0;width:40px;height:40px;padding:0;">
                                        <img src="<c:url value='image/edit.png'/>" alt="edit" width="20" />
                                    </button>
                                </a>
                                <form action="<c:url value='/delete'/>" method="post" style="margin:0px 5px;display:inline-block;">
                                    <input type="hidden" name="id" value="${data.id}" />
                                    <button type="submit"
                                            style="background-color:#FACDCA;border:1px solid #F30B0B;width:40px;height:40px;padding:0;">
                                        <img src="<c:url value='image/delete.png'/>" alt="delete" width="20" />
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>

        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="<c:url value='/list?nameSearch=${nameSearch}&amp;codeSearch=${codeSearch}&amp;depSearch=${depSearch}&amp;page=${currentPage-1}'/>">
                    <button>이전</button>
                </a>
            </c:if>
            <span>${currentPage} / ${totalPages}</span>
            <c:if test="${currentPage < totalPages}">
                <a href="<c:url value='/list?nameSearch=${nameSearch}&amp;codeSearch=${codeSearch}&amp;depSearch=${depSearch}&amp;page=${currentPage+1}'/>">
                    <button>다음</button>
                </a>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
