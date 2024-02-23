public class TST_ContactoHandler {
    
    public static void execute (List<Contact> contacts, System.TriggerOperation triggerEvent){
        
        switch on triggerEvent {
            
            when AFTER_INSERT {
                executeAfterUpdate(contacts);
            }
        }
    }
    
    public static void executeAfterUpdate(List<Contact> contactos){
        Set<Id> setcontacts = new Set<Id>();
        for (Contact ct : contactos) {
            if(ct.Tipo_de_Contacto__c == 'Importante'){
                setcontacts.add(ct.Id);
            }
        }
        if(!setcontacts.isEmpty()){
            doMagicEmail(setcontacts);
        }
    }
    
    @future
    public static void doMagicEmail(Set<Id> setcontacts){
        system.debug(setcontacts);
        if (!setcontacts.isEmpty()) {
            String addressEmail = 'egarciae@freewayconsulting.com';
            String subject = 'prueba email';
            String body = 'Body de email para prueba de triggers';
            Contact[] lstContacts = [SELECT Id,Name FROM Contact WHERE Id IN: setcontacts];
            for (Contact ct :lstContacts) {
                TST_ContactoUtilities.createTask(ct);
                TST_ContactoUtilities.sendEmail(addressEmail, subject, body);
            }             
        }
        
    }
}

