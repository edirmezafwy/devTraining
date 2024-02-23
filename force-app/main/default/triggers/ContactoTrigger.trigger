trigger ContactoTrigger on Contact (before insert, after insert) {

    trigger ContactoTrigger on Contact (before insert, after insert) {    
        TST_ContactoHandler.execute(Trigger.new, Trigger.operationType);
    }
}