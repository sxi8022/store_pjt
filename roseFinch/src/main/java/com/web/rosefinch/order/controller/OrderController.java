package com.web.rosefinch.order.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Controller
public class OrderController {

	@PostMapping(value = "/order")
	public String orderForm(Model model, @RequestParam("tmpordlist") String tmpordlist) {
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(tmpordlist);
		
		String gdsTitle = element.getAsJsonObject().get("gdsTitle").getAsString();
		JsonArray ordlist = element.getAsJsonObject().get("ordlist").getAsJsonArray();
		
		
		// http://yookeun.github.io/java/2017/05/27/java-gson/
		// https://stackoverflow.com/questions/18544133/parsing-json-array-into-java-util-list-with-gson
		JsonArray jsonArr = element.getAsJsonObject().get("ordlist").getAsJsonArray();
        //jsonArr.
		System.out.println("@@@@@@@@@@@@@" + jsonArr.toString());
        Gson googleJson = new Gson();
        ArrayList jsonObjList = googleJson.fromJson(jsonArr, ArrayList.class);
        System.out.println("List size is : "+jsonObjList.size());
        System.out.println("List Elements are  : "+jsonObjList.toString());
		
		int gdsDev = element.getAsJsonObject().get("gdsDev").getAsInt();
		String selName = element.getAsJsonObject().get("selName").getAsString();
		
		model.addAttribute("gdsTitle", gdsTitle);
		model.addAttribute("ordlist", jsonObjList.toArray());
		model.addAttribute("gdsDev", gdsDev);
		model.addAttribute("selName", selName);
		return "goods/order/order";
	}
	
	
	
}
