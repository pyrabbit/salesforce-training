public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds) {
        List<Contact> contacts = [SELECT AccountId FROM Contact WHERE AccountId IN :accountIds];
        List<Account> accounts = [SELECT Id FROM Account WHERE Id in :accountIds];

        for (Account a : accounts) {
            List<Contact> matchingContacts = new List<Contact>();

            for (Contact c : contacts) {
                if (c.AccountId == a.Id) {
                    matchingContacts.add(c);
                }
            }

            a.Number_Of_Contacts__c = matchingContacts.size();
        }

        upsert accounts;
    }
}