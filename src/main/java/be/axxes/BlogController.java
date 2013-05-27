package be.axxes;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/blogposts")
@Controller
@RooWebScaffold(path = "blogposts", formBackingObject = BlogPost.class)
public class BlogController {
}
