package motozio.controllers;

import motozio.model.HealthItem;
import motozio.service.HealthService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.codehaus.jackson.annotate.JsonRawValue;
import org.codehaus.jackson.annotate.JsonValue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class NavigationController {

    private static final Logger LOG = LoggerFactory.getLogger(NavigationController.class);

    private HealthService healthService;


    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView index() {

        //Put data into view
        ModelAndView mnv = new ModelAndView("index");

        return mnv;

    }

    @RequestMapping (value="/api/v1/footer", method=RequestMethod.GET)
    public  @ResponseBody String getHealthData(){

        String response = "";

        DateTime dt = new DateTime();
        DateTimeFormatter fmt = ISODateTimeFormat.dateTime();
        String curDate = fmt.print(dt);
        String hostName = healthService.getHostName();
        String projectVersion = healthService.getProjectVersion();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("hostName", hostName);
        map.put("curDate", curDate);
        map.put("projectVersion", projectVersion);

        // Check items
        List<HealthItem> items = new ArrayList<HealthItem>();


        // Get global help
        boolean isAppAvailable = true;
        for (HealthItem item : items) {
            if (!item.isAvailable()) {
                isAppAvailable = false;
            }
        }

        map.put("isAppAvailable", isAppAvailable);
        map.put("items", items);


        try {

            ObjectMapper mapper = new ObjectMapper();
            response =  mapper.writeValueAsString(map);


        } catch (Exception e) {

            LOG.error("Failed to map response to json" + e.getMessage());

        }

        return response;


    }

    public void setHealthService(HealthService healthService) {
        this.healthService = healthService;
    }

    public HealthService getHealthService() {
        return healthService;
    }


  }