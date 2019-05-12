package app.groupchat.config.security.util;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class SecurityUtils {
    public static boolean isAuthenticated(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        System.out.println("\nName of logged user = ["+currentPrincipalName+"]");
        return currentPrincipalName!="anonymousUser" && currentPrincipalName!=null ? true : false;
    }
}
