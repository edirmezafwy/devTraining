/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class TST_ContactoHandler {
    public static void execute(
        List<Contact> newContact, Map<Id, Contact> newContactMap,
        List<Contact> oldContact,Map<Id, Contact> oldContactMap,
        System.TriggerOperation operationType){

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
		System.debug('contacto');
        //Iteramos la lista recibida del trigger newContact
        for(Contact con: newContact){
            System.debug('Contacto en la iteracion');
            System.debug('Contacto con' + con);
            if(con.Tipo_de_Contacto__c == 'Importante'){
                System.debug('Contacto entro en condición');
                System.debug('Contacto Id' + con.Id);
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
                System.debug('email');
                System.debug('email full' + email);
            }
            else{
                System.debug('No entro en la condición');
            }
        }
		
        System.debug('TASK' + task);
        System.debug('EMAIL' + email);
        System.debug('Tamaño de la lista email: ' + email.size());
        if(!email.isEmpty()){
            System.debug('email no esta vacio');
            doInsertEmail(email);
        }
        //Se van evaluar task y email

        //Evaluación de task
        if(!task.isEmpty()){
            //Metodo de insercion
            doInsertTask(task);

        }
    }
    public static void doInsertTask(List<Task> tasks){
        System.debug('Entro en do Task');
        System.debug('Task: ' + tasks);
        if(!tasks.isEmpty()) {
            System.debug('tasks no esta vacio');
            insert tasks;
        }
    }
    
    public static void doInsertEmail(List<Messaging.SingleEmailMessage> emails){
        System.debug('Entro en el metodo del email.....');
        if(!emails.isEmpty()) {
            System.debug('email enviadoo');
            Messaging.sendEmail(emails);
        }
    }
}