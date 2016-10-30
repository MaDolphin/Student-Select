package com.demo.serviceImpl;

import com.demo.dao.IntentionMapper;
import com.demo.dao.TeacherMapper;
import com.demo.entity.Intention;
import com.demo.entity.Teacher;
import com.demo.service.TeacherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2016/10/25.
 */
@Service("teacherService")
public class TeacherServiceImpl implements TeacherService{
    @Resource
    private TeacherMapper teacherDao;
    @Resource
    private IntentionMapper intentionDao;

    public Teacher isExist(String userName, String password){
        return teacherDao.isExist(userName,password);
    }

    public List<Teacher> teacherInfoByMajorId(String majorId){
        return teacherDao.teacherInfoByMajorId(majorId);
    }

    @Override
    public ArrayList<Intention> queryIntentionByTeacher(String teacherId) {
        return intentionDao.queryIntentionByTeacher(teacherId);
    }

    @Override
    public void acceptStudent(int intentionId,int intentionOrder,String teacherId) {
        try {
            Intention intention = intentionDao.selectByPrimaryKey(intentionId);
            Teacher teacher = teacherDao.selectByPrimaryKey(teacherId);
            int order = 1;
            // order
            if(intention.getFirstOpttype()>0)
                order++;
            if(intention.getSecondOpttype()>0)
                order++;
            if(intention.getThirdOpttype()>0)
                order++;
            // set order into DB
            switch (intentionOrder){
                case 1:intention.setFirstOpttype(order);break;
                case 2:intention.setSecondOpttype(order);break;
                case 3:intention.setThirdOpttype(order);break;
            }
            // teacher_surplus --
            teacher.setTeacherSurplus(teacher.getTeacherSurplus()-1);
            // update to DB
            teacherDao.updateByPrimaryKey(teacher);
            intentionDao.updateByPrimaryKey(intention);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void refuseStudent(int intentionId,int intentionOrder,String teacherId) {
        try {
            Intention intention = intentionDao.selectByPrimaryKey(intentionId);
            Teacher teacher = teacherDao.selectByPrimaryKey(teacherId);
            int order = 1;
            // order
            if(intention.getFirstOpttype() > 0 && intention.getFirstOpttype() != 0)
                intention.setFirstOpttype(intention.getFirstOpttype()-1);
            if(intention.getSecondOpttype() > 0 && intention.getSecondOpttype() != 0)
                intention.setSecondOpttype(intention.getSecondOpttype()-1);
            if(intention.getThirdOpttype() > 0 && intention.getSecondOpttype() != 0)
                intention.setThirdOpttype(intention.getThirdOpttype()-1);
            // set order into DB
            switch (intentionOrder){
                case 1:intention.setFirstOpttype(0);break;
                case 2:intention.setSecondOpttype(0);break;
                case 3:intention.setThirdOpttype(0);break;
            }
            // teacher_surplus ++
            teacher.setTeacherSurplus(teacher.getTeacherSurplus()+1);
            // update to DB
            teacherDao.updateByPrimaryKey(teacher);
            intentionDao.updateByPrimaryKey(intention);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public Teacher queryTeacherByTeacherId(String teacherId) {
        return teacherDao.selectByPrimaryKey(teacherId);
    }

    @Override
    public void updateTeacher(Teacher teacher){
        teacherDao.updateByPrimaryKey(teacher);
    }

    public List<Teacher> exportVoluntaryInfoByCollegeName(String collegeName){
        return teacherDao.exportVoluntaryInfoByCollegeName(collegeName);
    }
}
