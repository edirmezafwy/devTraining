/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-23-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class TestDataFactory {
    public static Contact createContact(String firstName, String lastName, String email, String tipo) {
        Contact con = new Contact();
        con.FirstName = firstName;
        con.LastName = lastName;
        con.Email = email;
        con.Tipo_de_Contacto__c = tipo;
        insert con;
        return con;
    }

    public static User createUser(String userName, Profile prof) {
        User user = new User(
            UserName = userName + 'GR',
            FirstName = 'Test',
            LastName = 'User',
            Email = userName + 'axelgr96@hotmail.com',
            Alias = 'userRandom',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            TimeZoneSidKey = 'America/Los_Angeles',
            ProfileId = prof.Id
        );

        insert user;
        return user;
    }
}