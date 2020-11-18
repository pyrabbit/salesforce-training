public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String lastName) {
        List<Contact> contacts = new List<Contact>();

        for (Integer i = 0; i < numberOfContacts; i++) {
            String firstName = 'Jane'+i;
            contacts.add(new Contact(FirstName=firstName, LastName=lastName));
        }
        
        return contacts;
    }
}