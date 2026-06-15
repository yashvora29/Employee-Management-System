package util;

public class EmailUtil {

    public static boolean sendEmail(String to, String subject, String body) {

        System.out.println("====================================");
        System.out.println("EMAIL FEATURE EXECUTED");
        System.out.println("To      : " + to);
        System.out.println("Subject : " + subject);
        System.out.println("Body:");
        System.out.println(body);
        System.out.println("====================================");

        return true;
    }
}