package org.springside.examples.quickstart.web.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @RequestMapping(method = RequestMethod.GET)
    public String login() {
        return "account/editor";
    }
    @RequestMapping(value = "save",method=RequestMethod.POST)
    @ResponseBody
    public String save(@RequestParam("content") String content){
        System.out.println(content);
        return "true";
    }
}
