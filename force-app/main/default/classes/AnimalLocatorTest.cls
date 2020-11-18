@IsTest
public with sharing class AnimalLocatorTest {
    @IsTest
    private static void testGetAnimalNameById() {
        AnimalLocatorMock mock = new AnimalLocatorMock();
        Test.setMock(HTTPCalloutMock.class, mock);

        String name = AnimalLocator.getAnimalNameById(1);
        System.assertEquals('chicken', name);
    }

    @IsTest
    private static void testAnimalNotFound() {
        NotFoundHttpCalloutMock mock = new NotFoundHttpCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);

        String name = AnimalLocator.getAnimalNameById(1234);
        System.assertEquals(null, name);
    }

    @IsTest
    private static void testDeserializeAnimalResponse() {
        String json = '{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}';
        Animal animal = AnimalLocator.deserializeAnimalResponse(json);
        System.assertEquals('chicken', animal.name);
    }
}
