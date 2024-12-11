<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>검역 정보 상세보기</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/QuarantineForm.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="header.jsp" %>
<div class="container d-flex">
    <div>
        <div class="formHeader first">
            입국자 정보 [상세보기]
        </div>

        <div class="formWrapper">
            <table>
                <tbody>
                <tr>
                    <td colspan="10">
                        <div class="inlineFormGroup">
                            <label class="formLabel">이름</label>
                            <div class="controlWrapper">
                                <input type="text" class="formControl w-100" value="${existingData.name}" disabled />
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="inlineFormGroup">
                            <label class="formLabel">성별</label>
                            <div class="radioGroup">
                                <div class="radioButtons">
                                    <input type="radio" name="gender" value="1" disabled
                                           <c:if test="${existingData.gender == '1'}">checked</c:if>> 남성
                                    <input type="radio" name="gender" value="2" disabled
                                           <c:if test="${existingData.gender == '2'}">checked</c:if>> 여성
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <div class="inlineFormGroup">
                            <label class="formLabel">여권번호</label>
                            <div class="controlWrapper">
                                <input type="text" class="formControl w-100" value="${existingData.passportId}" disabled/>
                            </div>
                        </div>
                    </td>
                    <td colspan="4">
                        <div class="inlineFormGroup">
                            <label class="formLabel">국적</label>
                            <div class="controlWrapper">
                                <input type="text" class="formControl" value="${existingData.nationality}" disabled/>
                            </div>
                        </div>
                    </td>
                    <td colspan="2">
                        <div class="inlineFormGroup">
                            <label class="formLabel">생년월일</label>
                            <div class="controlWrapper">
                                <input type="date" class="formControl" value="${existingData.birthdate}" disabled/>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="10">
                        <div class="inlineFormGroup">
                            <label class="formLabel">주소</label>
                            <div class="controlWrapper">
                                <input type="text" class="formControl" value="${existingData.address}" disabled/>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="inlineFormGroup">
                            <label class="formLabel">연락처</label>
                            <div class="controlWrapper">
                                <input type="text" class="formControl" value="${existingData.contact}" disabled/>
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>

            <h2 class="formHeader second">여행 정보</h2>
            <fieldset class="fieldset">
                <table>
                    <tbody>
                    <tr>
                        <td>
                            <div class="inlineFormGroup">
                                <label class="formLabel">출발국가</label>
                                <div class="controlWrapper">
                                    <input type="text" class="formControl" value="${existingData.departure}" disabled/>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="inlineFormGroup">
                                <label class="formLabel">항공편명</label>
                                <div class="controlWrapper">
                                    <input type="text" class="formControl" value="${existingData.flightCode}" disabled/>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="inlineFormGroup">
                                <label class="formLabel">좌석번호</label>
                                <div class="controlWrapper">
                                    <input type="text" class="formControl" value="${existingData.seatNumber}" disabled/>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <div class="inlineFormGroup">
                    <label class="formLabel">방문 국가 (최근 21일)</label>
                    <div class="controlWrapper">
                        <c:if test="${not empty existingData.visitCountry}">
                            <textarea class="formControl" rows="3" disabled>
                                <c:forEach var="vc" items="${existingData.visitCountry}">
                                    ${vc}
                                </c:forEach>
                            </textarea>
                        </c:if>
                        <c:if test="${empty existingData.visitCountry}">
                            <input type="text" class="formControl" value="없음" disabled/>
                        </c:if>
                    </div>
                </div>
            </fieldset>

            <div class="formHeader third">건강상태 정보
                <div class="formHeaderButton">
                    <input type="checkbox" disabled <c:if test="${existingData.isHealthy}">checked</c:if>/> 증상 없음
                </div>
            </div>
            <fieldset class="fieldset">
                <div class="inlineFormGroup symptoms">
                    <div>
                        <table name="symptomTable" class="symptomTable">
                            <thead>
                            <tr>
                                <th colspan="4">증상</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <input type="checkbox" disabled <c:if test="${existingData.fever}">checked</c:if>> 발열
                                </td>
                                <td>
                                    <input type="checkbox" disabled <c:if test="${existingData.chills}">checked</c:if>> 오한
                                </td>
                                <td>
                                    <input type="checkbox" disabled <c:if test="${existingData.headache}">checked</c:if>> 두통
                                </td>
                                <td>
                                    <input type="checkbox" disabled <c:if test="${existingData.sore_throat}">checked</c:if>> 인후통
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" disabled <c:if test="${existingData.runny_nose}">checked</c:if>> 콧물
                                </td>
                                <td>
                                    <input type="checkbox" disabled <c:if test="${existingData.cough}">checked</c:if>> 기침
                                </td>
                                <td>
                                    <input type="checkbox" disabled <c:if test="${existingData.short_breath}">checked</c:if>> 호흡곤란
                                </td>
                                <td>
                                    <input type="checkbox" disabled <c:if test="${existingData.colic_diarrhea}">checked</c:if>> 복통/설사
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" disabled <c:if test="${existingData.vomit}">checked</c:if>> 구토
                                </td>
                                <td>
                                    <input type="checkbox" disabled <c:if test="${existingData.rash}">checked</c:if>> 발진
                                </td>
                                <td>
                                    <input type="checkbox" disabled <c:if test="${existingData.jaundice}">checked</c:if>> 황달
                                </td>
                                <td>
                                    <input type="checkbox" disabled <c:if test="${existingData.loss_consciousness}">checked</c:if>> 의식 저하
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" disabled <c:if test="${existingData.bloody_mucus}">checked</c:if>> 점막 지속 출혈
                                </td>
                                <td colspan="3">
                                    <input type="checkbox" disabled <c:if test="${existingData.other}">checked</c:if>> 기타
                                    <input type="text" class="formControl" value="${existingData.other_detail}" disabled/>
                                </td>
                            </tr>
                            </tbody>

                        </table>
                    </div>
                    <br/>
                    <div>
                        <table class="symptomTable">
                            <thead>
                            <tr>
                                <th colspan="4">의심 활동</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><input type="checkbox" disabled <c:if test="${existingData.take_medicine}">checked</c:if>> 증상 관련 약 복용</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" disabled <c:if test="${existingData.visit_hospital}">checked</c:if>> 현지 병원 방문</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" disabled <c:if test="${existingData.animal_contact}">checked</c:if>> 동물 접촉</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <br/>
                <div class="inlineFormGroup">
                    <label class="formLabel">비고</label>
                    <div class="controlWrapper">
                        <input type="text" class="formControl" value="${existingData.note}" disabled/>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="container">
        <div class="formHeader first">
            첨부파일 정보
        </div>
        <div class="formWrapper">
            <c:choose>
                <c:when test="${not empty existingData.fileName}">
                    <input type="text" class="formControl" value="${existingData.fileName}" disabled/>
                </c:when>
                <c:otherwise>
                    <input type="text" class="formControl" value="첨부 파일 없음" disabled/>
                </c:otherwise>
            </c:choose>
        </div>


        <div style="margin-top:20px;">
            <a href="<c:url value='/edit'/>" style="text-decoration:none;">
                <button type="button" class="btn btn-primary">수정</button>
            </a>
            <a href="<c:url value='/delete'/>" style="text-decoration:none; margin-left:10px;">
                <button type="button" class="btn btn-danger">삭제</button>
            </a>
            <a href="<c:url value='/list'/>" style="text-decoration:none; margin-left:10px;">
                <button type="button" class="btn btn-secondary">목록</button>
            </a>
        </div>
    </div>

</div>

</body>

</html>
