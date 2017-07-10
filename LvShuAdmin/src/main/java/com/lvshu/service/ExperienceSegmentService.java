package com.lvshu.service;

import com.lvshu.mapper.ExperienceSegmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class ExperienceSegmentService {
    @Autowired
    private ExperienceSegmentMapper expSegmentMapper;
}
