/**
 * @description       : 
 * @author            : egarciae@freewayconsulting.com
 * @group             : 
 * @last modified on  : 02-21-2024
 * @last modified by  : egarciae@freewayconsulting.com 
 * Modifications Log
 * Ver   Date         Author                        Modification
 * 1.0   02-21-2024   egarciae@freewayconsulting.com   Initial Version
**/
@isTest (SeeAllData=false)
public with sharing class TST_Contacto_Test {
    @TestSetup
    static void makeData(){
        Contact ct = TestDataFactory.createContact('TestTraining');
    }

    @IsTest
    static void createContactTest(){
        
        makeData();
        
    }

}