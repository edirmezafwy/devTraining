/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-23-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public with sharing class TST_ContactoHanlderTest {
    /*@TestSetup
    static void makeData(){
        //Creo un contacto
        Contact con = TestDataFactory.createContact('New Contact','Test','axelgr96@hotmail.com');
    }*/

    @isTest
    static void contactCreation() {
        Test.startTest();
        // Llama al método a probar
        Contact con = TestDataFactory.createContact('New Contact','Test','axelgr96@hotmail.com','Importante');
        


        
        Test.stopTest();
        
        

    }
}