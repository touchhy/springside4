package org.springside.examples.quickstart.web.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
