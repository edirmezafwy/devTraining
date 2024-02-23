public class TST_ContactoUtilities {
    public static void sendEmail (String address, String subject, String body){
        Messaging.SingleEmailMessage mail= new Messaging.SingleEmailMessage();
        string[] toAddresses= new string[] {address};
            mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextbody(body);
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        for(Messaging.SendEmailResult res:results) {
            if(res.isSuccess()) {
                System.debug('Email sent successfully ');
            } else {
                System.debug('Email sent Failed ');
            }
        }
    }
    
    public static void createTask (Contact ct){
        Task tk = new Task (
            OwnerId = UserInfo.getUserId(),
            Status = 'Not Started',
            WhoId = ct.Id
        );
         insert tk;
    }
}