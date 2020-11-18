@IsTest
public with sharing class AccountManagerTest {
    @IsTest
    public static void testGetAccount() {
        Account account = new Account(Name='Example Account');
        insert account;
    
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < 5; i++) {
            contacts.add(new Contact(AccountId=account.Id, LastName='Tester ' + i));
        }
        insert contacts;

        RestRequest request = new RestRequest();
        request.requestUri =
            'https://curious-fox-dtryuz.salesforce.com/services/apexrest/Accounts/'
            + account.Id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        Account fetchedAccount = AccountManager.getAccount();
        System.assertEquals(account.Id, fetchedAccount.Id);
        System.assertEquals(5, fetchedAccount.Contacts.size());
    }
}
