package com.jpubg.www;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

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
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        
        System.out.println(response.toString()); //결과, json결과를 parser하여 처리


		
	}
}
