package com.student.service;

import com.student.dao.AbsenceDAO;
import com.student.po.Absence;
import java.util.List;

public class AbsenceService {
    private AbsenceDAO absenceDAO = new AbsenceDAO();

    public List<Absence> getAllAbsences() {
        return absenceDAO.getAllAbsences();
    }
}