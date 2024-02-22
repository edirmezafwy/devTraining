/**
 * @description       : 
 * @author            : emeza@freewayconsulting.com
 * @group             : 
 * @last modified on  : 02-21-2024
 * @last modified by  : emeza@freewayconsulting.com
 * Modifications Log
 * Ver   Date         Author                        Modification
 * 1.0   02-20-2024   emeza@freewayconsulting.com   Initial Version
**/
trigger TST_AccountTrigger on Account (before insert, before update) {
    Trigger.new; //= LISTA de nuevos registros
    Trigger.newMap;// Mpa ID vs Lista nuevos Registros
    Trigger.old;//= LISTA de antiguos registros
    Trigger.oldMap;// Mpa ID vs Lista antiguos Registros
    String context; //variable de contexto
    TST_AccountHandler.execute(Trigger.new,Trigger.newMap,Trigger.old,Trigger.oldMap,System.TriggerOperation);
}