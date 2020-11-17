@isTest
public with sharing class AccountProcessorTest {
    @isTest 
    private static void testCountContacts() {
        Integer NUMBER_OF_ACCOUNTS = 2;
        Integer NUMBER_OF_CONTACTS = 5;

        List<Account> accounts = createTestAccounts(NUMBER_OF_ACCOUNTS);
        List<Id> accountIds = new List<Id>();
        for (Account a : accounts) {
            accountIds.add(a.Id);
            createTestAccountContacts(a.Id, NUMBER_OF_CONTACTS);
        }
        
        Test.startTest();
            AccountProcessor.countContacts(accountIds);
        Test.stopTest();

        List<Account> updatedAccounts = [SELECT Number_Of_Contacts__c FROM Account WHERE Id IN :accountIds];
        for (Account a : updatedAccounts) {
            System.assertEquals(NUMBER_OF_CONTACTS, a.Number_Of_Contacts__c);
        }
    }

    private static List<Account> createTestAccounts(Integer numberOfAccounts) {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < numberOfAccounts; i++) {
            accounts.add(new Account(Name='Test Account ' + i));
        }
        insert accounts;
        return accounts;
    }

    private static List<Contact> createTestAccountContacts(Id accountId, Integer numberOfContacts) {
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < numberOfContacts; i++) {
            contacts.add(new Contact(AccountId=accountId, LastName='Tester'));
        }
        insert contacts;
        return contacts;
    }
}
