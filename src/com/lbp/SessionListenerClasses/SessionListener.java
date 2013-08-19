package com.lbp.SessionListenerClasses;

import javax.servlet.http.*;

public class SessionListener implements HttpSessionListener  {

	public SessionListener() {
		// TODO Auto-generated constructor stub
	}
	 
    public void sessionCreated(HttpSessionEvent event) { 
        System.out.println("Session Created: " + event.getSession().getId());
    }
 
    public void sessionDestroyed(HttpSessionEvent event) {
        System.out.println("Session Destroyed: " + event.getSession().getId());
    }

}
