/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-23-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger ContactoTrigger on Contact (after insert) {
    Trigger.new;
    Trigger.newMap;
    Trigger.old;
    Trigger.oldMap;
    TST_ContactoHandler.execute(Trigger.new,Trigger.newMap,Trigger.old,Trigger.oldMap,System.TriggerOperation);
}