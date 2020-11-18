@IsTest
global class ParkServiceMock implements WebServiceMock {
    global void doInvoke(Object stub, Object request, Map<String, Object> response, String endpoint,
            String soapAction, String requestName, String responseNS, String responseName, String responseType) {

    parkService.byCountryResponse response_x = new parkService.byCountryResponse();
        List<String> parks = new List<String>();
        parks.add('Koala');
        parks.add('Tiger');
        parks.add('Monkey');

        response_x.return_x = parks;
        response.put('response_x', response_x);
    }
}
