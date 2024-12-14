package com.project.quarantine.quarantine.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class QuarantineVO {
    private int id;
    /**
     * 목록 생성한 userid
     */
    private int createdBy;
    /**
     * 확인한 관리자 id
     */
    private int approvedBy;
    /**
     * 증상 Table id
     */
    private int symptomsId;
    /**
     * 생성일
     */
    private Date createdAt;
    /**
     * 수정일
     */
    private Date updatedAt;
    /**
     * 생일
     */
    private String birthDate;
    /**
     * 성별 (0 : 남자 / 1: 여자)
     */
    private int gender;
    /**
     * 이름
     */
    private String name;
    /**
     * 여권 번호
     */
    private String passportId;
    /**
     * 국적
     */
    private String nationality;
    /**
     * 항공코드
     */
    private String flightCode;
    /**
     * 좌석번호
     */
    private String flightSeat;
    /**
     * 연락처
     */
    private String contact;
    /**
     * 방문국가
     */
    private String visitCountry;
    /**
     * 비고란
     */
    private String note;
    /**
     * 원래 file 이름
     */
    private String originalFileName;
    /**
     * uuid 변환 File 이름 (실제 저장되는 파일 이름)
     */
    private String uuidFileName;
    /**
     * 출발국가
     */
    private String departure;
    /**
     * 승인여부
     */
    private int approved;
    /**
     * 증상 유무 (int)
     * 0 : 증상없음 1 : 증상있음
     */
    private int isHealthy;

    public QuarantineVO(int symptomsId, String birthDate, int gender, String name, String passportId, String nationality, String flightCode, String flightSeat, String contact, String note, String visitCountry, String originalImgName,String uuidFileName, String departure, int isHealthy, int approved) {
        this.symptomsId = symptomsId;
        this.birthDate = birthDate;
        this.name = name;
        this.gender = gender;
        this.note = note;
        this.passportId = passportId;
        this.nationality = nationality;
        this.flightCode = flightCode;
        this.flightSeat = flightSeat;
        this.contact = contact;
        this.visitCountry = visitCountry;
        this.originalFileName = originalImgName;
        this.uuidFileName = uuidFileName;
        this.departure = departure;
        this.isHealthy = isHealthy;
        this.approved = approved;
    }
}
