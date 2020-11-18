public with sharing class AnimalLocator {
    private static String URL_BASE = 'https://th-apex-http-callout.herokuapp.com/animals/';

    public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest request = createGetAnimalNameByIdRequest(id);
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) {
            Animal animal = deserializeAnimalResponse(response.getBody());
            return animal.name;
        }

        return null;
    }

    public static Animal deserializeAnimalResponse(String responseBody) {
        AnimalJsonSerializer serializer = (AnimalJsonSerializer) JSON.deserialize(responseBody, AnimalJsonSerializer.class);
        return serializer.animal;
    }

    private static HttpRequest createGetAnimalNameByIdRequest(Integer id) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(URL_BASE + id);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        return request;
    }

    public class AnimalJsonSerializer {
        public Animal animal; 
    }
}
   

