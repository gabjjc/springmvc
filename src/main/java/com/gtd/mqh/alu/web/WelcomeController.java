package com.gtd.mqh.alu.web;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gtd.mqh.alu.mappers.ossmqh.OssMqhMapper;
import com.gtd.mqh.alu.service.HelloWorldService;
import com.gtd.mqh.alu.service.OssService;


@Controller
public class WelcomeController {

    private final Logger logger = LoggerFactory.getLogger(WelcomeController.class);
    private final HelloWorldService helloWorldService;
    private final OssService ossService;
   
    
    @Autowired
    public WelcomeController(HelloWorldService helloWorldService, OssService ossService) {
        this.helloWorldService = helloWorldService;
        this.ossService = ossService;
    }
   
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Map<String, Object> model) {

        logger.debug("index() is executed!");

        model.put("title", helloWorldService.getTitle(""));
        model.put("msg", helloWorldService.getDesc());
        
        List<String> options = ossService.getNodes();
        
        /*options.add("Another action");  
        options.add("Something else here");
        options.add("Separated link");
        */
        model.put("dropdown", options);
        
        return "index";
    }

    @RequestMapping(value = "/hello/{name:.+}", method = RequestMethod.GET)
    public ModelAndView hello(@PathVariable("name") String name) {

        logger.debug("hello() is executed - $name {}", name);

        ModelAndView model = new ModelAndView();
        model.setViewName("index");
        
        model.addObject("title", helloWorldService.getTitle(name));
        model.addObject("msg", helloWorldService.getDesc());
        
        return model;

    }

}