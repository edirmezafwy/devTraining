/**
 * @description       : 
 * @author            : emeza@freewayconsulting.com
 * @group             : 
 * @last modified on  : 02-23-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
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

    public static Contact createContact(String firstName, String lastName, String email) {
        Contact con = new Contact();
        con.FirstName = firstName;
        con.LastName = lastName;
        con.Email = email;
        insert con;
        return con;
    }
}