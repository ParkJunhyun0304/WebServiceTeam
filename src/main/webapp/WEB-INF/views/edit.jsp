<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>검역 폼 [수정]</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/QuarantineForm.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div>
<%@ include file="header.jsp" %>
</div>
<div class="container-md d-flex mt-4">
    <div>
        <div class="formHeader first">
            입국자 정보 [수정]
        </div>

        <div class="formWrapper">
            <form:form id="quarantineForm" method="post" action="updatePassenger">
                <form:hidden path="id"/>

                <table>
                    <tbody>
                    <tr>
                        <td colspan="10">
                            <div class="inlineFormGroup">
                                <label class="formLabel">이름</label>
                                <div class="controlWrapper">
                                    <form:input path="name" cssClass="formControl"/>
                                    <form:errors path="name" cssClass="invalidFeedback"/>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="inlineFormGroup">
                                <label class="formLabel">성별</label>
                                <div class="radioGroup">
                                    <div class="radioButtons">
                                        <form:radiobutton path="gender" value="1"/> 남성
                                        <form:radiobutton path="gender" value="2"/> 여성
                                    </div>
                                    <form:errors path="gender" cssClass="invalidFeedback"/>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <div class="inlineFormGroup">
                                <label class="formLabel">여권번호</label>
                                <div class="controlWrapper">
                                    <form:input path="passportId" cssClass="formControl"/>
                                    <form:errors path="passportId" cssClass="invalidFeedback"/>
                                </div>
                            </div>
                        </td>
                        <td colspan="4">
                            <div class="inlineFormGroup">
                                <label for="nationality" class="formLabel">국적</label>
                                <div class="controlWrapper">
                                    <form:select path="nationality" cssClass="formControl">
                                        <form:option value="">국적을 선택하세요</form:option>
                                        <form:options items="${countryOptions}"/>
                                    </form:select>
                                    <form:errors path="nationality" cssClass="invalidFeedback"/>
                                </div>
                            </div>
                        </td>
                        <td colspan="2">
                            <div class="inlineFormGroup">
                                <label class="formLabel">생년월일</label>
                                <div class="controlWrapper">
                                    <form:input path="birthdate" cssClass="formControl" type="date"/>
                                    <form:errors path="birthdate" cssClass="invalidFeedback"/>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="10">
                            <div class="inlineFormGroup">
                                <label class="formLabel">주소</label>
                                <div class="controlWrapper">
                                    <form:input path="address" cssClass="formControl"/>
                                    <form:errors path="address" cssClass="invalidFeedback"/>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="inlineFormGroup">
                                <label class="formLabel">연락처</label>
                                <div class="controlWrapper">
                                    <form:input path="contact" cssClass="formControl"/>
                                    <form:errors path="contact" cssClass="invalidFeedback"/>
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
                                        <form:select path="departure" cssClass="formControl">
                                            <form:option value="">출발국가를 선택하세요</form:option>
                                            <form:options items="${countryOptions}"/>
                                        </form:select>
                                        <form:errors path="departure" cssClass="invalidFeedback"/>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="inlineFormGroup">
                                    <label class="formLabel">항공편명</label>
                                    <div class="controlWrapper">
                                        <form:input path="flightCode" cssClass="formControl"/>
                                        <form:errors path="flightCode" cssClass="invalidFeedback"/>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="inlineFormGroup">
                                    <label class="formLabel">좌석번호</label>
                                    <div class="controlWrapper">
                                        <form:input path="seatNumber" cssClass="formControl"/>
                                        <form:errors path="seatNumber" cssClass="invalidFeedback"/>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <div class="inlineFormGroup">
                        <label class="formLabel">방문 국가 (최근 21일)</label>
                        <div class="controlWrapper">
                            <form:select path="visitCountry" multiple="true" cssClass="formControl" size="5">
                                <form:options items="${countryOptions}"/>
                            </form:select>
                        </div>
                    </div>
                </fieldset>

                <div class="formHeader third">건강상태 정보
                    <div class="formHeaderButton">
                        <form:checkbox path="isHealthy" cssClass="form-check-input" value="true"/> 증상 없음
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
                                    <td><form:checkbox path="fever" class="symptom-checkbox"/> 발열</td>
                                    <td><form:checkbox path="chill" class="symptom-checkbox"/> 오한</td>
                                    <td><form:checkbox path="headache" class="symptom-checkbox"/> 두통</td>
                                    <td><form:checkbox path="sore_throat" class="symptom-checkbox"/> 인후통</td>
                                </tr>
                                <tr>
                                    <td><form:checkbox path="runny_nose" class="symptom-checkbox"/> 콧물</td>
                                    <td><form:checkbox path="cough" class="symptom-checkbox"/> 기침</td>
                                    <td><form:checkbox path="short_breath" class="symptom-checkbox"/> 호흡곤란</td>
                                    <td><form:checkbox path="colic_diarrhea" class="symptom-checkbox"/> 복통/설사</td>
                                </tr>
                                <tr>
                                    <td><form:checkbox path="vomit" class="symptom-checkbox"/> 구토</td>
                                    <td><form:checkbox path="rash" class="symptom-checkbox"/> 발진</td>
                                    <td><form:checkbox path="jaundice" class="symptom-checkbox"/> 황달</td>
                                    <td><form:checkbox path="loss_consciousness" class="symptom-checkbox"/> 의식 저하</td>
                                </tr>
                                <tr>
                                    <td><form:checkbox path="bloody_mucus" class="symptom-checkbox"/> 점막 지속 출혈</td>
                                    <td colspan="3">
                                        <form:checkbox path="other" class="symptom-checkbox"/> 기타
                                        <form:input path="other_detail" cssClass="formControl"/>
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
                                    <td><form:checkbox path="take_medicine"/> 증상 관련 약 복용</td>
                                </tr>
                                <tr>
                                    <td><form:checkbox path="visit_hospital"/> 현지 병원 방문</td>
                                </tr>
                                <tr>
                                    <td><form:checkbox path="animal_contact"/> 동물 접촉</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br/>
                    <div class="inlineFormGroup">
                        <label class="formLabel">비고</label>
                        <div class="controlWrapper">
                            <form:input path="note" cssClass="formControl"/>
                        </div>
                    </div>
                </fieldset>
            </form:form>
        </div>
    </div>
    <div class="container">
        <div class="formHeader first">
            첨부파일 업로드
        </div>
        <div class="formWrapper ">
            <input type="file" name="file" class="formControl"/>
        </div>
        <button id="submitButton" type="submit" class="submitButton" form="quarantineForm">수정</button>
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
