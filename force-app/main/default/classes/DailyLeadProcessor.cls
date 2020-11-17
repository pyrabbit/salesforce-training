global class DailyLeadProcessor implements Schedulable {
    global static void execute(SchedulableContext sc) {
        List<Lead> leads = [SELECT LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];

        for (Lead l : leads) {
            l.LeadSource = 'Dreamforce';
        }

        update leads;
    }
}
