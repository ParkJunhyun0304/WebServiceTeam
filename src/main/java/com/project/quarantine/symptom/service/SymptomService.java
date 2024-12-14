package com.project.quarantine.symptom.service;

import com.project.quarantine.quarantine.service.QuarantineService;
import com.project.quarantine.quarantine.vo.QuarantineVO;
import com.project.quarantine.symptom.dao.SymptomDAO;
import com.project.quarantine.symptom.vo.SymptomVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class SymptomService {

    @Autowired
    SymptomDAO symptomDAO;
    @Autowired
    QuarantineService quarantineService;

    public SymptomVO getSymptom(int id) {
        QuarantineVO quarantineVO = quarantineService.getQuarantine(id); // id를 갖고 검역정보 받아옴
        return symptomDAO.getSymptomById(quarantineVO.getSymptomsId()); // 검역정보 안에 있는 증상 테이블 id로 객체 찾기
    }

    public int insertSymptom(HttpServletRequest request) {

        int fever = parseSafeInt(request.getParameter("fever"));
        int chill = parseSafeInt(request.getParameter("chill"));
        int headache = parseSafeInt(request.getParameter("headache"));
        int soreThroat = parseSafeInt(request.getParameter("soreThroat"));
        int runnyNose = parseSafeInt(request.getParameter("runnyNose"));
        int cough = parseSafeInt(request.getParameter("cough"));
        int shortBreath = parseSafeInt(request.getParameter("shortBreath"));
        int colicDiarrhea = parseSafeInt(request.getParameter("colicDiarrhea"));
        int vomit = parseSafeInt(request.getParameter("vomit"));
        int rash = parseSafeInt(request.getParameter("rash"));
        int jaundice = parseSafeInt(request.getParameter("jaundice"));
        int lossConsciousness = parseSafeInt(request.getParameter("lossConsciousness"));
        int bloodyMucus = parseSafeInt(request.getParameter("bloodyMucus"));
        int takeMedicine = parseSafeInt(request.getParameter("takeMedicine"));
        int animalContact = parseSafeInt(request.getParameter("animalContact"));
        int visitHospital = parseSafeInt(request.getParameter("visitHospital"));

        SymptomVO symptomVO = new SymptomVO(fever,chill,headache,soreThroat,runnyNose,cough,shortBreath,colicDiarrhea,vomit,
                rash,jaundice,lossConsciousness,bloodyMucus,takeMedicine,animalContact,visitHospital);

        return symptomDAO.insertSymptom(symptomVO);
    }

    private int parseSafeInt(String param) {
        try {
            return (param != null && !param.isEmpty()) ? Integer.parseInt(param) : 0;
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}
