public with sharing class AccountHandler {
    public AccountHandler() {

    }

    public static Account insertNewAccount(String name) {
        try {
            Account acct = new Account(Name=name);
            insert acct;
            return acct;
        } catch (DmlException e) {
            System.debug('Failed to create new account: ' + e.getMessage());
            return null;
        }
    }
}
