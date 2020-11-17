@IsTest
public with sharing class AddPrimaryContactTest {
    @IsTest
    public static void testAddPrimaryContact() {
        createAccountsWithStateAbbr(50, 'NY');
        createAccountsWithStateAbbr(50, 'CA');
        
        Contact c = new Contact(LastName='Tester');

        Test.startTest();
            AddPrimaryContact job = new AddPrimaryContact(c, 'CA');
            System.enqueueJob(job);
        Test.stopTest();

        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState='CA'];
        List<Id> accountIds = new List<Id>();
        for (Account a : accounts) {
            accountIds.add(a.Id);
        }

        Integer count = [SELECT count() FROM Contact WHERE AccountId IN :accountIds];
        System.assertEquals(50, count);
    }

    private static void createAccountsWithStateAbbr(Integer numberOfRecords, String stateAbbr) {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < numberOfRecords; i++) {
            Account a = new Account(Name='Tester Account ' + i, BillingState=stateAbbr);
            accounts.add(a);
        }
        insert accounts;
    }
}
