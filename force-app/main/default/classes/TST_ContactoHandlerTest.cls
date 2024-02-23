/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-23-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public with sharing class TST_ContactoHanlderTest {
    @TestSetup
    static void makeData(){
        Contact con = TestDataFactory.createContact('New Contact','Test','axelgr96@hotmail.com');
    }

    @isTest
    static void contactCreation() {
        Contact con = [SELECT Id, FirstName,LastName,email,tipoDeContacto Limit 1];
        con.tipoDeContacto = 'Importante';
        Test.startTest();
        System.runAs(contextuser){
            insert con;
        }
        Test.stopTest();
    }
}