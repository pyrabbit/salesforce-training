@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        // Parse request
        RestRequest request = RestContext.request;
        String id = request.requestURI.substringBetween('Accounts/','/contacts');
        
        // Collect account and contacts
        Account account = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id = :id];
        return account;
    }
}