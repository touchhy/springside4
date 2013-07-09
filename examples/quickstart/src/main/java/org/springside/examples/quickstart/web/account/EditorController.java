package org.springside.examples.quickstart.web.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springside.examples.quickstart.entity.Content;
import org.springside.examples.quickstart.service.content.ContentService;

/**
 * Created with IntelliJ IDEA.
 * User: zhangbin
 * Date: 13-7-7
 * Time: 下午8:45
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value = "/editor")
public class EditorController {
    @Autowired
    private ContentService contentService;
    @RequestMapping(method=RequestMethod.GET)
    public String get(){
        contentService.selectByTaskId(2L);
       return "account/editor";
    }

    @RequestMapping(value="brower/{taskId}",method = RequestMethod.GET)
    public String brower(@PathVariable("taskid")long taskId,Model model) {
        if(taskId>0){
           model.addAttribute("content",contentService.selectByTaskId(taskId));
        }
        return "account/editor";
    }
    @RequestMapping(value = "save",method=RequestMethod.POST)
    @ResponseBody
    public String save(@RequestParam("content") String content,@RequestParam("taskId") long taskId){
        contentService.delete(taskId);
        Content saveContent = new Content();
        saveContent.setContent(content);
        saveContent.setTaskId(taskId);
        contentService.save(saveContent);
        return "true";
    }
}
