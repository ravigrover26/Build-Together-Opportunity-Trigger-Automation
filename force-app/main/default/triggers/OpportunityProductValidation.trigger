trigger OpportunityProductValidation on Opportunity (before insert, before update){
    for (Opportunity opp : Trigger.new ){
        if (opp.StageName != 'Prospecting' && opp.OpportunityLineItems.size() == 0){
            opp.StageName.addError('At least one Opportunity Product is required when the Opportunity Stage is past "Prospecting".');
        }
    }
}