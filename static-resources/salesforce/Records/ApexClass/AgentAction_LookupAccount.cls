global class AgentAction_LookupAccount {

    // Define the input structure
    global class Request {
        @InvocableVariable(required=true)
        public Account objectToSummarize;
    }

    // Define the output structure
    global class Response {
        @InvocableVariable
        public String Prompt;
    }

    // Invocable method to be used as a Reference Action
    @InvocableMethod(CapabilityType='PromptTemplateType://einstein_gpt__recordSummary')
    global static List<Response> findAccount(List<Request> requests) {
        List<Response> results = new List<Response>();

        for (Request req : requests) {
            Response res = new Response();

            // Example: using Website field as a proxy for email domain (you can change this to a custom field)
            List<Account> matches = [
                SELECT Id, Name
                FROM Account
                LIMIT 1
            ];


            results.add(res);
        }

        return results;
    }
}