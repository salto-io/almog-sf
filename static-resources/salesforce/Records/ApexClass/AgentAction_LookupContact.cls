global class AgentAction_LookupContact {

    // Define the input structure
    global class Request {
        @InvocableVariable(required=true)
        public String email;
    }

    // Define the output structure
    global class Response {
        @InvocableVariable
        public Id contactId;

        @InvocableVariable
        public String contactName;
    }

    // Invocable method to be used as a Reference Action
    @InvocableMethod(label='Find Contact by Email' description='Returns Contact Id and Name by Email')
    global static List<Response> findContactByEmail(List<Request> requests) {
        List<Response> results = new List<Response>();

        for (Request req : requests) {
            Response res = new Response();

            // Query contact
            List<Contact> matches = [
                SELECT Id, Name FROM Contact WHERE Email = :req.email LIMIT 1
            ];

            if (!matches.isEmpty()) {
                res.contactId = matches[0].Id;
                res.contactName = matches[0].Name;
            }

            results.add(res);
        }

        return results;
    }
}