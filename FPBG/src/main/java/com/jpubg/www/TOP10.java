package com.jpubg.www;

import java.io.BufferedReader;
import java.io.InputStreamReader;import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import pro.lukasgorny.enums.PUBGSeason;

public class TOP10 {
	public TOP10()throws Exception {
		
		URL url = new URL("https://pubgtracker.com/api/profile/pc/Mester_Noah");
		
		System.out.println("URL : " + url.toExternalForm());
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.addRequestProperty("User-Agent", 
				"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)");

		conn.setRequestProperty("Content-Type", "application/json");
		
        conn.setDoOutput(true);
		
		conn.setRequestMethod("GET");
		
		conn.setConnectTimeout(10000);
		
		conn.setReadTimeout(10000);
		
		conn.setRequestProperty("TRN-API-KEY", "a56b69fc-a8ab-4d5b-a151-24868ea4d28d");
        
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
        
        String inputLine;
        String response = new String();

        while ((inputLine = in.readLine()) != null) {
            response += inputLine;
        }
        in.close();
        //결과, json결과를 parser하여 처리
        
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();
        System.out.println(parser.parse(response));
//        System.out.println();
//        JsonArray array = (JsonArray)parser.parse(response).getAsJsonObject().get("Stats");
//        System.out.println();
//        System.out.println(array.get(0));
//        JsonElement jelement = new JsonParser().parse(response);
//        JsonObject jobject = jelement.getAsJsonObject();
//        JsonObject jobject2 = jobject.getAsJsonObject("Stats");
//        JsonArray jarray = jobject2.getAsJsonArray("Stats");
//        JsonObject jobject3 = new JsonObject();
//        jobject3 = jarray.get(0).getAsJsonObject();
//        String result = jobject.get("label").toString();
//        System.out.println(result);
	}
}
