public with sharing class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String stateAbbr;

    public AddPrimaryContact(Contact contact, String stateAbbr) {
        this.contact = contact;
        this.stateAbbr = stateAbbr;
    }

    public void execute(QueueableContext qc) {
        List<Account> accounts = [select Id from Account where BillingState = :this.stateAbbr limit 200];
        List<Contact> contacts = new List<Contact>();

        for (Account a : accounts) {
            Contact c = this.contact.clone();
            c.AccountId = a.Id;
            contacts.add(c);
        }
        
        insert contacts;
    }
}
