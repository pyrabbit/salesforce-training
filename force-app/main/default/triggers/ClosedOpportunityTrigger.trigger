trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasks = new List<Task>();

    for(Opportunity o : Trigger.New) {
        if (o.StageName == 'Closed Won') {
            Task t = new Task(Subject='Follow Up Test Task', WhatId=o.Id);
            tasks.add(t);
        }   
    }

    if (tasks.size() > 0) {
        insert tasks;
    }
}