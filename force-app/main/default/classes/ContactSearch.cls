public with sharing class ContactSearch {
    public ContactSearch() {

    }

    public static List<Contact> searchForContacts(String lastName, String postalCode) {
        Contact[] contacts = [SELECT LastName, MailingPostalCode FROM Contact WHERE LastName = :lastName AND MailingPostalCode = :postalCode];
        return contacts;
    }
}