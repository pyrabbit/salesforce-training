public with sharing class LeadProcessor implements Database.Batchable<sObject> {
    public static Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT LeadSource FROM Lead]);
    }

    public static void execute(Database.BatchableContext bc, List<Lead> records) {
        for (Lead l : records) {
            l.LeadSource = 'Dreamforce';
        }
        update records;
    }

    public static void finish(Database.BatchableContext bc) {

    }
}