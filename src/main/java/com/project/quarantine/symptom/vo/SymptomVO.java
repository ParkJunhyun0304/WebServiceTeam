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
     * 0 : 증상없음 1 : 증상있음
     */
    private int fever;
    /**
     * 오한
     * 0 : 증상없음 1 : 증상있음
     */
    private int chill;
    /**
     * 두통
     * 0 : 증상없음 1 : 증상있음
     */
    private int headache;
    /**
     * 인후통
     * 0 : 증상없음 1 : 증상있음
     */
    private int soreThroat;
    /**
     * 콧물
     * 0 : 증상없음 1 : 증상있음
     */
    private int runnyNose;
    /**
     * 기침
     * 0 : 증상없음 1 : 증상있음
     */
    private int cough;
    /**
     * 호흡곤란
     * 0 : 증상없음 1 : 증상있음
     */
    private int shortBreath;
    /**
     * 복통 또는 설사
     * 0 : 증상없음 1 : 증상있음
     */
    private int colicDiarrhea;
    /**
     * 구토
     * 0 : 증상없음 1 : 증상있음
     */
    private int vomit;
    /**
     * 발진
     * 0 : 증상없음 1 : 증상있음
      */
    private int rash;
    /**
     * 황달
     * 0 : 증상없음 1 : 증상있음
     */
    private int jaundice;
    /**
     * 의식저하
     * 0 : 증상없음 1 : 증상있음
     */
    private int lossConsciousness;
    /**
     * 점막 지속 출혈
     * 0 : 증상없음 1 : 증상있음
     */
    private int bloodyMucus;
    /**
     * 약 복용
     * 0 : 없음 1 : 있음
     */
    private int takeMedicine;
    /**
     * 동물 접촉
     * 0 : 없음 1 : 있음
     */
    private int animalContact;
    /**
     * 현지 병원 방문
     * 0 : 없음 1 : 있음
     */
    private int visitHospital;


    public SymptomVO(int fever, int chill, int headache, int soreThroat, int runnyNose, int cough, int shortBreath, int colicDiarrhea, int vomit, int rash, int jaundice, int lossConsciousness, int bloodyMucus, int takeMedicine, int animalContact, int visitHospital) {
        this.fever = fever;
        this.chill = chill;
        this.headache = headache;
        this.soreThroat = soreThroat;
        this.runnyNose = runnyNose;
        this.cough = cough;
        this.shortBreath = shortBreath;
        this.colicDiarrhea = colicDiarrhea;
        this.vomit = vomit;
        this.rash = rash;
        this.jaundice = jaundice;
        this.lossConsciousness = lossConsciousness;
        this.bloodyMucus = bloodyMucus;
        this.takeMedicine = takeMedicine;
        this.animalContact = animalContact;
        this.visitHospital = visitHospital;
    }
}
