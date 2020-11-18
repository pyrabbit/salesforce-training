@IsTest
public with sharing class LeadProcessorTest {
    @IsTest
    private static void testLeadProcessor() {
        createTestLeads(200);

        Test.startTest();
            LeadProcessor lp = new LeadProcessor();
            Id batchId = Database.executeBatch(lp);
        Test.stopTest();

        System.assertEquals(200, [select count() from lead where LeadSource='Dreamforce']);
    }

    private static void createTestLeads(Integer numberOfRecords) {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < numberOfRecords; i++) {
            leads.add(new Lead(LastName='Doe ' + i, Company='ISACA ' + i));
        }
        insert leads;
    }
}