# Pipeline Templates

The ultimate goal is to have some templates which can be used to deploy TF using Azure DevOps Pipelines or GitHub Actions. The templates should also be used to run tools, ideally, using docker containers vs. installing and running the tools from the agents.

## Checkov

This is used to do security scanning using the OSS version of Checkov. The results are exported using JUNIT in Azure DevOps and when published, shows the test data directly in the portal.

- [ ] Need to make sure all the inputs are parameters and also provide options for passing skipped checks.

## Infracost

This is used to check the cost of infrastructure provide a breakdown.

- [ ] Need to add functionality to deny or fail the pipeline if a budget is exceeded. This will be a custom script taking a variable - I like Python for this stuff, but doesnt have to be super complicated.

## TF Build

This is the plan job for terraform. need to check to make sure all the values are parameters where required.

- [ ] Check parameters and update as needed.
- [ ] add a task which will check formatting if a parameter of "checkFormat" is == to true. If not, skip it. This will use `terraform fmt --check` if the value is true and fail the pipeline if the files are not linted correctly.

## TFauto

This is the pipeline task group to automatically apply the changes if the variables are set as expected. Essentially, if there are only changes, no deletes, then the pipeline will automatically apply the changes.

- [ ] Check parameters and update as needed.
- [ ] Cleanup set variables, perhaps?

## TF Manual

This requires someone to approve the deployment before it will complete.

- [ ] Replace the manual deployment check with an environment deployment option instead. <https://learn.microsoft.com/en-us/azure/devops/pipelines/process/approvals?view=azure-devops&tabs=check-pass>

## tfcheck.py

Currently, we use the tfcheck.py script to check the plan output and provide some information related to the plan. At its core, its check the plan to find any adds, removes, or changes and then sets pipeline variables accordingly.

## azure-pipeline.yml

Lets consolidate the jobs into a stage template which can be called which would include all the job templates.

```yaml
-| Pipeline.yml
----| BuildStage.yml
------| checkov.yml
------| infracost.yml
------| build.yml
----| ApplyStage.yml
------| autoApply.yml
------| manualApply.yml
```

This way we can call the template x number of times to build out larger workflows. We will need to handle the dependencies and variable passing between jobs/stages/etc.

## Work in Progress list

- [ ] Checkov template for GitHub Actions
- [ ] Infracost template for GitHub Actions
- [ ] tfsec template for GitHub Actions
- [ ] tfsec template for DevOps Pipelines
- [ ] Terrascan template for DevOps Pipelines
- [ ] Terrascan template for GitHub Actions
