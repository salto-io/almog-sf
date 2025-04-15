global class AgentAction_LookupProduct {

    // Define the input structure — must ONLY include 'userInstructions'
    global class Request {
        @InvocableVariable(required=true)
        public String userInstructions;
    }

    // Define the output structure — typically a string called Prompt
    global class Response {
        @InvocableVariable
        public String Prompt;
    }

    // Invocable method compatible with einstein_gpt__extractProduct
    @InvocableMethod(CapabilityType='PromptTemplateType://einstein_gpt__extractProduct')
    global static List<Response> findProduct(List<Request> requests) {
        List<Response> results = new List<Response>();

        for (Request req : requests) {
            Response res = new Response();

            // Dummy lookup: return first available product for now
            List<Product2> matches = [
                SELECT Id, Name
                FROM Product2
                LIMIT 1
            ];

            if (!matches.isEmpty()) {
                Product2 matchedProduct = matches[0];
                res.Prompt = 'Product found: ' + matchedProduct.Name;
            } else {
                res.Prompt = 'No product found.';
            }

            results.add(res);
        }

        return results;
    }
}