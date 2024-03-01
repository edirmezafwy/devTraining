/**
 * @description       : 
 * @author            : emeza@freewayconsulting.com
 * @group             : 
 * @last modified on  : 02-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log
 * Ver   Date         Author                        Modification
 * 1.0   02-20-2024   emeza@freewayconsulting.com   Initial Version
**/
public with sharing class TST_AccountHandler {
    public execute(List<Account> accNewlst,
    Map<Id,Account> accNewMap, List<Account> accOldlst,
    Map<Id,Account> accOldMap,String operationType){
        switch on operationType {
            when BEFORE_INSERT {
                executeBeforeInsert(accNewlst,accNewMap);
            }
            when BEFORE_UPDATE {
                executeBeforeUpdate(accNewlst, accNewMap, accOldlst, accOldMap);
            }
            when else {
                
            }
        }
    }
    public static void executeBeforeInsert(List<Account> accNewlst, Map<Id,Account> accNewMap) {
        Boolean flag;
        List<Account> accNewlstEvaluated = new List<Account>();
        for (Account acc : accNewlst) {
            if(acc.AccountType == 'Partner'){
                accNewlstEvaluated.add(acc);
            }
        }
        if(!accNewlstEvaluated.isEmpty()){
            doMagicInsert(accNewlstEvaluated);
        }
    }
    public static void executeBeforeUpdate(List<Account> accNewlst,Map<Id,Account> accNewMap, List<Account> accOldlst,Map<Id,Account> accOldMap) {
        List<Account> accNewlstEvaluated = new List<Account>();
        for (Account acci : accNewlst) {
            Account accj = accOldMap.get(acci.Id);
            if(acci.AccountSource != accj.AccountSource && acci.AccountSource == 'Evento'){
                accNewlstEvaluated.add(acci);
            }
        }
        if(!accNewlstEvaluated.isEmpty()){
            doMagicUpdate(accNewlstEvaluated);
        }
    }

    public static void doMagicInsert(List<Account> accNewlstEvaluated) {
        for (Account acc : accNewlstEvaluated) {
            acc.BillingCountry = 'México';
        }
    }

    public static void doMagicUpdate(List<Account> accNewlstEvaluated) {
        Set<Id> setAccount = new Set<Id>();
        for (Account acc : accNewlstEvaluated) {
            setAccount.add(acc.Id);
        }
        sentToExternal(setAccount);

    }
    @future
    public static void sentToExternal(Set<Id> setAccount) {
        Account[] lstAcc = [SELECT Id,Name FROM Account WHERE Id IN: setAccount];
        // send to external
    }
}