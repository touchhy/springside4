package org.springside.examples.quickstart.service.content;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.quickstart.entity.Content;
import org.springside.examples.quickstart.repository.ContentDao;
import org.springside.examples.quickstart.repository.TaskDao;

/**
 * Created with IntelliJ IDEA.
 * User: zhangbin
 * Date: 13-7-8
 * Time: 下午8:37
 * To change this template use File | Settings | File Templates.
 */
//Spring Bean的标识.
@Component
// 默认将类中的所有public函数纳入事务管理.
@Transactional
public class ContentService {
    private ContentDao contentDao;

    public void delete(long taskId){
       contentDao.deleteByTaskId(taskId);
    }

    public Content selectByTaskId(long taskId){
       return contentDao.selectByTaskId(taskId);
    }

    public void save(Content content){
       contentDao.save(content);
    }
    @Autowired
    public void setContentDao(ContentDao contentDao) {
        this.contentDao = contentDao;
    }
}
