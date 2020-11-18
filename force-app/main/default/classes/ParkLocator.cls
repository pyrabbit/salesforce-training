public with sharing class ParkLocator {
    public static List<String> country(String country) {
        parkService.ParksImplPort parks = new parkService.ParksImplPort();
        return parks.byCountry(country);
    }
}
