# Charmed Kuebflow Kubernetes setup
This repo is contains collection of steps for setting up Charmed Kubeflow on single Amazon EC2 instance. 

## Prerequisites
You need to have AWS account. [Here](https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-creating.html) you can find steps on how to create one. 

**IMPORTANT NOTE**: to run the kubeflow in EC2 instance we need to use at least `t2.2xlarge` instance type with at least 50GBs of storage (in demo I use `gp2`). Prepare to pay for this instance (around 10 dollars, the value is just estimate reality may be higher). 

Deployment may take up to 30 minutes.

## Further reading
Read more about [Kubeflow](https://www.kubeflow.org/). Read more about [Charmed Kubeflow](https://charmed-kubeflow.io/)

## Author
I will try to update the repo as frequently as possible. Checkout also our [installation guide](https://charmed-kubeflow.io/docs/quickstart). 
[Michal Hucko](https://www.linkedin.com/in/michal-hucko/)