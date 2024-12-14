package com.project.quarantine.quarantine.service;

import com.project.quarantine.quarantine.dao.QuarantineDAO;
import com.project.quarantine.quarantine.vo.QuarantineVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class QuarantineService {

    @Autowired
    QuarantineDAO quarantineDAO;

    public List<QuarantineVO> getQuarantineList() {
        return quarantineDAO.getQuarantineList();
    }

    public List<QuarantineVO> filterQuarantine(String nameSearch, String codeSearch, String depSearch) {
        return quarantineDAO.filterQuarantine(nameSearch,codeSearch,depSearch);
    }

    public int addQuarantine(HttpServletRequest request) {
        return quarantineDAO.addQuarantine(request);
    }

    public QuarantineVO getQuarantine(int id) {
        return quarantineDAO.getQuarantine(id);
    }
}
