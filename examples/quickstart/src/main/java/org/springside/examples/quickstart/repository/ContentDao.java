package org.springside.examples.quickstart.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springside.examples.quickstart.entity.Content;

/**
 * Created with IntelliJ IDEA.
 * User: zhangbin
 * Date: 13-7-8
 * Time: 下午8:05
 * To change this template use File | Settings | File Templates.
 */
public interface ContentDao extends CrudRepository <Content,Long>{
    @Modifying
    @Query("delete from Content content where content.taskId=?1")
    void deleteByTaskId(Long taskid);

    @Query("select content from Content content where content.taskId=?1")
    Content selectByTaskId(Long taskid);
}
