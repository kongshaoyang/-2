package com.lvshu.service;

import com.lvshu.common.DateEx;
import com.lvshu.common.TableID;
import com.lvshu.mapper.SuggestionMapper;
import com.lvshu.model.Suggestion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class SuggestionService {
    @Autowired
    private SuggestionMapper suggestionMapper;


    public boolean addSuggestion(Suggestion suggestion) throws Exception {
        boolean bRet = false;
        try {
            String suggestionNum = suggestionMapper.getSuggestionNum();
            suggestionNum = TableID.getTabId(suggestionNum, TableID.SUGGESTION_PREFIX);
            suggestion.setSuggestNum(suggestionNum);
            DateEx dt = new DateEx();
            suggestion.setPublishTime(dt.getDateTimeStandard());
            suggestionMapper.addSuggestion(suggestion);
            bRet = true;
        } catch (Exception e) {
            throw e;
        }
        return bRet;
    }

    public Suggestion getSuggestion(String suggestionNum) throws Exception {
        Suggestion suggestion = null;
        try {
            suggestion = suggestionMapper.getSuggestion(suggestionNum);
        } catch (Exception e) {
            throw e;
        }
        return suggestion;
    }


    public List<Suggestion> getSuggestionByUserNum(String userNum) throws Exception{
        List<Suggestion> list = null;
        try {
            list = suggestionMapper.getSuggestionByUserNum(userNum);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
}
