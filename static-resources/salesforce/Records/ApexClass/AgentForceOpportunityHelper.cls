public with sharing class AgentForceOpportunityHelper {
    @AuraEnabled(cacheable=true)
    public static Integer getOpenOpportunityCount(String accountId) {
        if (String.isBlank(accountId)) {
            throw new AuraHandledException('Account ID is required.');
        }

        Integer openOppCount = [
            SELECT COUNT() 
            FROM Opportunity 
            WHERE AccountId = :accountId AND IsClosed = FALSE
        ];

        return openOppCount;
    }
}