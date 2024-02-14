# Workload Identity Federation

Workload identity federation lets applications running outside Google Cloud impersonate a service account by using credentials from an external identity provider.


# Key Usescases

- External CI/CD Systems ( Gitlab/Github, Bitbucket ) accessing GCP Resources
- CI/CD running in Other Cloud Provider accessing GCP Resources
- Access Cross Project Resources for Orgs with tight security boundaries 
- LDAP Integration such as Okta

# How it works

https://storage.googleapis.com/gweb-cloudblog-publish/images/2_GitHub_Actions.max-1100x1100.jpg


# Reference Docs

https://cloud.google.com/blog/products/identity-security/enabling-keyless-authentication-from-github-actions



# Pre-requisites

-  GCP Project
-  Owner/User permissions to enable relevant APIs 
-  Github Repo 
   
   Add the following Github Secrets to the github repo secret ( PROJECT_NUMER, POOL_NAME, PROVIDER_NAME, SERVICE_ACCOUNT )


# Components 

This repository contains 2 components
-  Workload Identity Federation : Terraform Setup
-  Sample Use of Workload Identity Federation to create a sample service account 


Step 1 : Workload Identity Federation | Folder : wif

- Use your tf vars file or update the variables file within the WIF Folder such as project, region, zone, github repo to be used to access GCP resources
- execute tf plan & apply from your laptop
- Verify if workload identity federation is created in GCP Console with respective service account & service account permissions
- The console should output the below variables as example. 
      
    POOL_NAME       = "github-pool-08c7173a"
    PROVIDER_NAME   = "projects/hariprasad-sundaresan-0202/locations/global/workloadIdentityPools/github-pool-08c7173a/providers/github-pool-provider-08c7173a"
    SERVICE_ACCOUNT = "github-sa@hariprasad-sundaresan-0202.iam.gserviceaccount.com"

- Add the above values as  Github Secrets to the github repo, these will be used in the pipeline


Step 2 : Use Workload Identity Federation to create GCP Resources | Folder : Resources

- In this example, A simple GCP service account is created along with the github ci/cd pipeline
- Things to check
    - github workflow actions : apply.yml









