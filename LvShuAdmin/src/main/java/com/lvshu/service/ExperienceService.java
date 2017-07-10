package com.lvshu.service;

import com.lvshu.common.DateEx;
import com.lvshu.common.TableID;
import com.lvshu.mapper.ExperienceMapper;
import com.lvshu.model.Experience;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class ExperienceService {
    @Autowired
    private ExperienceMapper experienceMapper;

    public boolean addExperience(Experience experience) throws Exception {
        boolean bRet = false;
        try {
            String experienceNum = experienceMapper.getExperienceNum();
            experienceNum = TableID.getTabId(experienceNum, TableID.COMMENT_PREFIX);
            experience.setExperienceNum(experienceNum);
            DateEx dt = new DateEx();
            experience.setPublishTime(dt.getDateTimeStandard());
            experienceMapper.addExperience(experience);
            bRet = true;
        } catch (Exception e) {
            throw e;
        }
        return bRet;
    }

    public Experience getExperience(String experienceNum) throws Exception {
        Experience experience = null;
        try {
            experience = experienceMapper.getExperience(experienceNum);
        } catch (Exception e) {
            throw e;
        }
        return experience;
    }


    public List<Experience> getExperienceByUserNum(String userNum) throws Exception{
        List<Experience> list = null;
        try {
            list = experienceMapper.getExperienceByUserNum(userNum);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
}
