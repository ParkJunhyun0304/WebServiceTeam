package com.project.quarantine.quarantine.dao;

import com.project.quarantine.file.service.FileService;
import com.project.quarantine.quarantine.vo.QuarantineVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class QuarantineDAO {

    @Autowired
    SqlSession sqlSession;
    @Autowired
    FileService fileService;

    public List<QuarantineVO> getQuarantineList() {
        List<QuarantineVO> quarantineList = sqlSession.selectList("Quarantine.selectList");
        return quarantineList;
    }

    public List<QuarantineVO> filterQuarantine(String nameSearch, String codeSearch, String depSearch) {
        Map<String, Object> map = new HashMap<>();
        map.put("nameSearch", nameSearch);
        map.put("codeSearch", codeSearch);
        map.put("depSearch", depSearch);

        return sqlSession.selectList("Quarantine.filterQuarantine", map);
    }

    public int addQuarantine(HttpServletRequest request) {
        QuarantineVO quarantineVO = fileService.uploadData(request);
        return sqlSession.insert("Quarantine.insertList", quarantineVO);
    }

    public QuarantineVO getQuarantine(int id) {
        return sqlSession.selectOne("Quarantine.selectOne", id);
    }
}
