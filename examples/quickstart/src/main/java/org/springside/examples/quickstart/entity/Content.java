package org.springside.examples.quickstart.entity;

import javax.persistence.*;

/**
 * Created with IntelliJ IDEA.
 * User: zhangbin
 * Date: 13-7-8
 * Time: 下午7:44
 * To change this template use File | Settings | File Templates.
 */
//JPA标识
@Entity
@Table(name = "content")
public class Content extends IdEntity{
    @Column(unique=true)
    private long taskId;
    private String content;

    public long getTaskId() {
        return taskId;
    }

    public void setTaskId(long taskId) {
        this.taskId = taskId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
