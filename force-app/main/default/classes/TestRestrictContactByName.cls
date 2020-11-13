@isTest
private class TestRestrictContactByName {
    @isTest static void testRestrictsInvalidName() {
        Contact c = new Contact(LastName='INVALIDNAME');
        
        Test.startTest();
            Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();

        System.assert(!result.isSuccess());
    }

    @isTest static void testAllowsValidName() {
        Contact c = new Contact(LastName='VALIDNAME');

        Test.startTest();
            Database.SaveResult result = Database.insert(c, true);
        Test.stopTest();

        System.assert(result.isSuccess());
    }
}
