package com.FPBG.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticatior extends Authenticator {
	
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
    	return new PasswordAuthentication("place24@solunaweb.co.kr","thffnsktltmxpa12");
    }
    
}
