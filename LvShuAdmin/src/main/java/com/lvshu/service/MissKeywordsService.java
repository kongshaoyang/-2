package com.lvshu.service;

import com.lvshu.mapper.MissKeywordsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class MissKeywordsService {
    @Autowired
    private MissKeywordsMapper missKeywordsMapper;
}
