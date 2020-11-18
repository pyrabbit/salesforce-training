@isTest
private class TestVerifyDate {
    @isTest static void testReturnsDateWithin30Days() {
        Date date1 = Date.newInstance(2020,3,1);
        Date date2 = Date.newInstance(2020,3,5);
        System.assertEquals(date2, VerifyDate.CheckDates(date1,date2));
    }

    @isTest static void testReturnsEndOfMonth() {
        Date date1 = Date.newInstance(2020,3,1);
        Date date2 = Date.newInstance(2020,10,5);
        Date expected = Date.newInstance(2020,3,31);
        System.assertEquals(expected, VerifyDate.CheckDates(date1,date2));
    }

    @isTest static void testPastDate() {
        Date date1 = Date.newInstance(2020,3,1);
        Date date2 = Date.newInstance(2020,2,5);
        Date expected = Date.newInstance(2020,3,31);
        System.assertEquals(expected, VerifyDate.CheckDates(date1,date2));
    }
}