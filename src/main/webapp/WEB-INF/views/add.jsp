<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>검역 폼</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/QuarantineForm.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/yup@latest/dist/yup.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>

<%@ include file="header.jsp" %>
<div class="container d-flex">
    <div>
        <div class="formHeader first">
            입국자 정보
        </div>

        <div class="formWrapper">
            <form id="quarantineForm" method="post" action="addPassenger">
                <table>
                    <tbody>
                    <tr>
                        <td colspan="10">
                            <div class="inlineFormGroup">
                                <label class="formLabel">이름</label>
                                <div class="controlWrapper">
                                    <input name="name" type="text" class="formControl w-100" value="">
                                    <c:if test="${errors.name != null}">
                                        <div class="invalidFeedback">${errors.name}</div>
                                    </c:if>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="inlineFormGroup">
                                <label class="formLabel">성별</label>
                                <div class="radioGroup">
                                    <div class="radioButtons">
                                        <input type="radio" name="gender" value="1"> 남성
                                        <input type="radio" name="gender" value="2"> 여성
                                    </div>
                                    <c:if test="${errors.gender != null}">
                                        <div class="invalidFeedback">${errors.gender}</div>
                                    </c:if>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <div class="inlineFormGroup">
                                <label class="formLabel">여권번호</label>
                                <div class="controlWrapper">
                                    <input name="passportId" type="text" class="formControl w-100" value="">
                                    <c:if test="${errors.passportId != null}">
                                        <div class="invalidFeedback">${errors.passportId}</div>
                                    </c:if>
                                </div>
                            </div>
                        </td>
                        <td colspan="4">
                            <div class="inlineFormGroup">
                                <label for="nationality" class="formLabel">국적</label>
                                <div class="controlWrapper">
                                    <select name="nationality" id="nationality">
                                        <option value="">국적을 선택하세요</option>
                                        <option value="한국">한국</option>
                                        <option value="미국">미국</option>
                                        <option value="중국">중국</option>
                                        <option value="일본">일본</option>
                                    </select>
                                    <c:if test="${errors.nationality != null}">
                                        <div class="invalidFeedback">${errors.nationality}</div>
                                    </c:if>
                                </div>
                            </div>
                        </td>
                        <td colspan="2">
                            <div class="inlineFormGroup">
                                <label class="formLabel">생년월일</label>
                                <div class="controlWrapper">
                                    <input name="birthdate" type="date" class="formControl w-100" value="">
                                    <c:if test="${errors.birthdate != null}">
                                        <div class="invalidFeedback">${errors.birthdate}</div>
                                    </c:if>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="10">
                            <div class="inlineFormGroup">
                                <label class="formLabel">주소</label>
                                <div class="controlWrapper">
                                    <input name="address" type="text" class="formControl w-100" value="">
                                    <c:if test="${errors.address != null}">
                                        <div class="invalidFeedback">${errors.address}</div>
                                    </c:if>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="inlineFormGroup">
                                <label class="formLabel">연락처</label>
                                <div class="controlWrapper">
                                    <input name="contact" type="text" class="formControl w-100" value="">
                                    <c:if test="${errors.contact != null}">
                                        <div class="invalidFeedback">${errors.contact}</div>
                                    </c:if>
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
                                        <select name="departure" class="formControl">
                                            <option value="">출발국가를 선택하세요</option>
                                            <option value="한국">한국</option>
                                            <option value="미국">미국</option>
                                            <option value="중국">중국</option>
                                            <option value="일본">일본</option>
                                        </select>
                                        <c:if test="${errors.departure != null}">
                                            <div class="invalidFeedback">${errors.departure}</div>
                                        </c:if>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="inlineFormGroup">
                                    <label class="formLabel">항공편명</label>
                                    <div class="controlWrapper">
                                        <input name="flightCode" type="text" class="formControl" value="">
                                        <c:if test="${errors.flightCode != null}">
                                            <div class="invalidFeedback">${errors.flightCode}</div>
                                        </c:if>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="inlineFormGroup">
                                    <label class="formLabel">좌석번호</label>
                                    <div class="controlWrapper">
                                        <input name="seatNumber" type="text" class="formControl" value="">
                                        <c:if test="${errors.seatNumber != null}">
                                            <div class="invalidFeedback">${errors.seatNumber}</div>
                                        </c:if>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <div class="inlineFormGroup">
                        <label class="formLabel">방문 국가 (최근 21일)</label>
                        <div class="controlWrapper">
                            <select name="visitCountry" class=" dropdown w-100" multiple>
                                <option value="">국가를 선택하세요(최대 4개)</option>
                                <option value="한국">한국</option>
                                <option value="미국">미국</option>
                                <option value="중국">중국</option>
                                <option value="일본">일본</option>
                            </select>
                        </div>
                    </div>
                </fieldset>

                <div class="formHeader third">건강상태 정보
                    <div class="formHeaderButton">
                        <input type="checkbox" id="isHealthy" name="isHealthy" value="true" checked> 증상 없음
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
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="fever"> 발열
                                    </td>
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="chills" > 오한
                                    </td>
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="headache" > 두통
                                    </td>
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="sore_throat" > 인후통
                                    </td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="runny_nose" > 콧물
                                    </td>
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="cough" > 기침
                                    </td>
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="short_breath" > 호흡곤란
                                    </td>
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="colic_diarrhea" > 복통/설사
                                    </td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="vomit" > 구토
                                    </td>
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="rash" > 발진
                                    </td>
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="jaundice" > 황달
                                    </td>
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="loss_consciousness" > 의식 저하
                                    </td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="bloody_mucus"> 점막 지속 출혈
                                    </td>
                                    <td colspan="3" class="">
                                        <input type="checkbox" class="symptom-checkbox" name="other"> 기타
                                        <input type="text" name="otherDetail" class="formControl" value="">
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
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="take_medicine" value="true"> 증상 관련 약 복용
                                    </td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="visit_hospital" value="true"> 현지 병원 방문
                                    </td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <input type="checkbox" class="symptom-checkbox" name="animal_contact" value="true"> 동물 접촉
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br/>
                    <div class="inlineFormGroup">
                        <label class="formLabel">비고</label>
                        <div class="controlWrapper">
                            <input type="text" name="note" class="formControl w-100" value="">
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <div class="container">
        <div class="formHeader first">
            첨부파일 업로드
        </div>
        <div class="formWrapper ">
            <input type="file" name="file" class="formControl"/>
        </div>
        <button id="submitButton" type="submit" class="submitButton" form="quarantineForm">제출</button>
    </div>

</div>

</body>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const symptomCheckboxes = document.querySelectorAll(".symptom-checkbox");
        const isHealthyCheckbox = document.getElementById("isHealthy");

        symptomCheckboxes.forEach((checkbox) => {
            checkbox.addEventListener("change", function () {
                if (this.checked) {
                    isHealthyCheckbox.checked = false;
                }
                checkAll();
                updateStyle(checkbox);
            });
        });

        function checkAll() {
            const allUnchecked = Array.from(symptomCheckboxes).every((checkbox) => !checkbox.checked);
            if (allUnchecked) {
                isHealthyCheckbox.checked = true;
            }
        }


        symptomCheckboxes.forEach((checkbox) => {
            checkbox.addEventListener("change", function () {
                if (this.checked) {
                    isHealthyCheckbox.checked = false;
                }
                updateStyle(checkbox);
            });
        });

        function updateStyle(checkbox) {
            if (checkbox.checked) {
                checkbox.parentElement.classList.add("checkedCell");
            } else {
                checkbox.parentElement.classList.remove("checkedCell");
            }
        }

        symptomCheckboxes.forEach(updateStyle);
    });

</script>

</html>


