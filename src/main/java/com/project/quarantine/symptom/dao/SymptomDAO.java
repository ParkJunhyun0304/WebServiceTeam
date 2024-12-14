package com.project.quarantine.symptom.dao;

import com.project.quarantine.symptom.vo.SymptomVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class SymptomDAO {

    @Autowired
    SqlSession sqlSession;

    public SymptomVO getSymptomById(int symptomId) {
        return sqlSession.selectOne("Symptom.selectOne", symptomId);
    }

    public int insertSymptom(SymptomVO symptomVO) {
        sqlSession.insert("Symptom.insertSymptom", symptomVO);
        return symptomVO.getId();
    }
}
