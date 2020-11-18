public with sharing class ContactAndLeadSearch {
    public ContactAndLeadSearch() {

    }

    public static List<List<SObject>> searchContactsAndLeads(String searchValue) {
        return [FIND :searchValue IN NAME FIELDS RETURNING Contact(FirstName), Lead(Name) ];
    }
}