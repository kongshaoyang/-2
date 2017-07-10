package com.lvshu.service;

import com.lvshu.common.DateEx;
import com.lvshu.common.TableID;
import com.lvshu.mapper.CommentMapper;
import com.lvshu.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class CommentService {
    @Autowired
    private CommentMapper commentMapper;


    public boolean addComment(Comment comment) throws Exception {
        boolean bRet = false;
        try {
            String commentNum = commentMapper.getCommentNum();
            commentNum = TableID.getTabId(commentNum, TableID.COMMENT_PREFIX);
            comment.setCommentNum(commentNum);
            DateEx dt = new DateEx();
            comment.setPublishTime(dt.getDateTimeStandard());
            //commentMapper.addComment(comment);
            bRet = true;
        } catch (Exception e) {
            throw e;
        }
        return bRet;
    }

    public Comment getComment(String commentNum) throws Exception {
        Comment comment = null;
        try {
            comment = commentMapper.getComment(commentNum);
        } catch (Exception e) {
            throw e;
        }
        return comment;
    }


    public List<Comment> getCommentByUserNum(String userNum) throws Exception{
        List<Comment> list = null;
        try {
            list = commentMapper.getCommentByUserNum(userNum);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
}
