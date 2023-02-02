# Spacelift Management

This is the directory used to manage spacelift using IaC. Here is a brief summary of the Spacelift deployment. The full spacelift documentation can be found here: <https://docs.spacelift.io/>

## Spaces

Spaces are organziation units within the app allowing for logical and functional separation. The following spaces are deployed to support our implementation of Spacelift.

The root space, which is a default space which really shouldn't be used but for things the entire platform should have access too. This would include shared modules, policies, contexts, etc. but only items which should be shared across all other spaces and stacks.

Coretek -- This is the first, non-root space, which will contain all things related to Coretek. Subsequent spaces will be deployed to further segment access based on requirements.
Coretek -> Azure-Managed-Services - This space is the parent to all managed services customers.
Coretek -> smartcloud - This space will be used for all Smartcloud resources, stacks, and spaces.
Coretek -> smartcloud -> spacelift-sandbox - This will be used for any testing of Spacelift by the azure team - the azure team will have full admin access to this stack
