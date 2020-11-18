@IsTest
public with sharing class ParkLocatorTest {
    @IsTest
    public static void testGetByCountry() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List<String> parks = ParkLocator.country('Canada');
        System.assertEquals(new List<String> {'Koala', 'Tiger', 'Monkey'}, parks);
    }
}
