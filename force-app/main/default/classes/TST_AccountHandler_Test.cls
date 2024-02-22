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
@isTest (SeeAllData=false)
public with sharing class TST_AccountHandler_Test {
    @TestSetup
    static void makeData(){
        Account acc = TestDataFactory.createAccount('Test');
    }





    @IsTest
    static void methodName(){
        Account acc = [SELECT Id,Name,AccountSource FROM Account LIMIT 1];
        acc.AccountSource = 'Evento';
        Test.startTest();
        System.runAs(contextuser){
            update acc;
        }
        Test.stopTest();
        
    }
}