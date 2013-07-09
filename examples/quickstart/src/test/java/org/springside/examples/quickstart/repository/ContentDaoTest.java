package org.springside.examples.quickstart.repository;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springside.examples.quickstart.entity.Content;
import org.springside.examples.quickstart.service.content.ContentService;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

/**
 * Created with IntelliJ IDEA.
 * User: zhangbin
 * Date: 13-7-8
 * Time: 下午8:28
 * To change this template use File | Settings | File Templates.
 */
@ContextConfiguration(locations = { "/applicationContext.xml" })
public class ContentDaoTest extends SpringTransactionalTestCase {
    private static Logger logger = LoggerFactory.getLogger(ContentDaoTest.class);
    @Autowired
    private ContentDao contentDao;
    @Test
    public void simpleTest(){
       Content content =  contentDao.selectByTaskId(3L);
       logger.debug("ok",content.getContent());
       contentDao.deleteByTaskId(3L);
    }
}
