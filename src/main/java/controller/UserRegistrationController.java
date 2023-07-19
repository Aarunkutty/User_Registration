package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.UserRegistrationDao;
import dto.UserRegistrationDto;

@Controller
public class UserRegistrationController {


	@PostMapping("/signup")
	public ModelAndView processRegistrationForm(@ModelAttribute UserRegistrationDto dto, UserRegistrationDao dao) {
		System.out.println(dto);
		String string = dao.insert(dto);

		ModelAndView view = new ModelAndView("index.jsp");
		view.addObject("msg", string);
		return view;
	}

}
