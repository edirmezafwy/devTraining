/**
 * @description       : 
 * @author            : emeza@freewayconsulting.com
 * @group             : 
 * @last modified on  : 02-21-2024
 * @last modified by  : emeza@freewayconsulting.com
 * Modifications Log
 * Ver   Date         Author                        Modification
 * 1.0   02-21-2024   emeza@freewayconsulting.com   Initial Version
**/
public with sharing class TestDataFactory {
    public static Account createAccount(String AccName) {
        Account acc = new Account(
            Name = AccName,
            AccountType = 'Partner'
        );
        insert acc;
        return acc;
    }

    public static Contact createContact(String ctLastName) {
        Contact ct = new Contact(
            lastName = ctLastName,
            Tipo_de_Contacto__c = 'importante'
        );
        insert ct;
        return ct;
    }
}