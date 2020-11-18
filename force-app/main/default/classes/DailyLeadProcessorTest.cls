@IsTest
public with sharing class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 13 * * ?';

    public static testmethod void testDailyLeadProcessor() {
        createTestLeadRecords(200);

        Test.startTest();
            System.schedule('ScheduledDailyLeadProcessor', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();

        Integer count = [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, count);
    }

    private static void createTestLeadRecords(Integer numberOfRecords) {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < numberOfRecords; i++) {
            leads.add(new Lead(LastName='Tester', Company='Test Company ' + i));
        }
        insert leads;
    }
}