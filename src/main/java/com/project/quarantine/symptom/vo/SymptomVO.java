package com.project.quarantine.symptom.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class SymptomVO {
    private int id;
    /**
     * 열
     */
    private boolean fever;
    /**
     * 오한
     */
    private boolean chill;
    /**
     * 두통
     */
    private boolean headache;
    /**
     * 인후통
     */
    private boolean soreThroat;
    /**
     * 콧물
     */
    private boolean runnyNose;
    /**
     * 기침
     */
    private boolean cough;
    /**
     * 호흡곤란
     */
    private boolean shortBreath;
    /**
     * 복통 또는 설사
     */
    private boolean colicDiarrhea;
    /**
     * 구토
     */
    private boolean vomit;
    /**
     * 발진
      */
    private boolean rash;
    /**
     * 황달
     */
    private boolean jaundice;
    /**
     * 의식저하
     */
    private boolean lossConsciousness;
    /**
     * 점막 지속 출혈
     */
    private boolean bloodyMucus;
    /**
     * 약 복용
     */
    private boolean takeMedicine;
    /**
     * 동물 접촉
     */
    private boolean animalContact;
    /**
     * 현지 병원 방문
     */
    private boolean visitHospital;


}
