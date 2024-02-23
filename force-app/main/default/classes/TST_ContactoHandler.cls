/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-23-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class TST_ContactoHandler {
    public static void execute(
        List<Contact> newContact, Map<Id, Contact> newContactMap,
        List<Contact> oldContact,Map<Id, Contact> oldContactMap,
        String operationType){

            switch on operationType {
                when AFTER_INSERT  {
                    executeAfterInsert(newContact,newContactMap);
                }
                when else {
                }
            }
    }

    public static void executeAfterInsert(List<Contact> newContact, Map<Id, Contact> newContactMap){
        //Lista para crear la tarea
        List<Task> task = new List<Task>();
        //Lista para el Email a enviar
        List<Messaging.SingleEmailMessage> email = new List<Messaging.SingleEmailMessage>();

        //Iteramos la lista recibida del trigger newContact
        for(Contact con: newContact){
            if(con.Tipo_de_Contacto__c == 'Importante'){
                 // Crear una tarea para seguimiento y agregarlo a la lista task
                 Task newTask = new Task();
                 newTask.Subject = 'Seguimiento de contacto importante';
                 newTask.Description = 'Realizar seguimiento al nuevo contacto importante: ' + con.FirstName;
                 newTask.WhatId = con.Id;
                 task.add(newTask);

                 
                // Enviar un correo electrónico de notificación al equipo de ventas y agregarlo a la lista email
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new String[] {'algarcia@freewayconsulting.com'}); 
                mail.setSubject('Nuevo contacto importante creado: ' + con.FirstName);
                mail.setPlainTextBody('Se ha creado un nuevo contacto importante: ' + con.FirstName);
                email.add(mail);
            }
        }

        //Se van evaluar task y email

        //Evaluación de task
        if(!task.isEmpty()){
            //Metodo de insercion
            doInsertTask(task);

        }

        if(!email.isEmpty()){
            //metodo de insercion
            doInsertEmail(email);
        }
    }
    public static void doInsertTask(List<Task> tasks){
        if(!tasks.isEmpty()) {
            insert tasks;
        }
    }
    
    public static void doInsertEmail(List<Messaging.SingleEmailMessage> emails){
        if(!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}