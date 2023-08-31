P.S. It is better to fork this project into Gitlab
##### Project description
This project implement complex task of creating infrastructure and software development on existing Kubernetes Cluster.
Project repository has all needed for:
- Create RDS-managed PostgresDB on AWS
- Deploy Gitlab-runner for this project in Kubernetes cluster
- Deploy Apache-Airflow to Kubernetes cluster
- Deploy API, that works with _sales_ database
- All other needed components, services, permissions, roles, etc. for grant all components work together

##### Creating infrastructure

Terraform code is separated in two directories: k8s and postgresql.

In postgresql implemented rds instance with random generated password for login. Also imported existed vpc and created subnet_grop and security_group for rds.
All credentials for rds instance(username, password, endpoint, ds_names) saved in SSM Parameter Store.

To check is all this things is up to data move to `terraform/postgresql` directory and run next commands:

`terraform init -backend-config envs/dev.conf` where -backend-config declare a file with terraform configuration.

`terraform plan -var-file envs/dev.tfvars` where -var-file declare a file with no-static variables for terraform resources.

If there are any differences with infrastructure run this command:
`terraform apply -var-file envs/dev.tfvars`



In k8s implemented secrets for eks cluster via kubernetes provider that declared using imported eks parameters.
Also k8s irsa role for gitlab rummer was created via terraform. 
To check is all this things is up to data move to `terraform/k8s` directory and run next commands:

`terraform init -backend-config envs/dev.conf` where -backend-config declare a file with terraform configuration.

`terraform plan -var-file envs/dev.tfvars` where -var-file declare a file with no-static variables for terraform resources.

If there are any differences with infrastructure run this command:
`terraform apply -var-file envs/dev.tfvars`

##### Deploying gitlab-runner
After this step you'll get working gitlab-runner in Kubernetes Cluster registered for jobs for this(or another) project.
For deploying gitlab-runner use official gitlab-runner chart, run
```commandline
helm repo add gitlab https://charts.gitlab.io
helm repo update gitlab
```
If needed change _gitlabUrl, runners.secret, runners.serviceAccountName_. Secret may be stored in _Kubernetes Secret_. Then run:
```commandline
helm install --namespace <NAMESPACE> gitlab-runner -f <CONFIG_VALUES_FILE> gitlab/gitlab-runner
```
##### Deploying Airflow
Result of this step will be working Apache-Airflow platform, configured for working with RDS Postgres database.
Airflow chart requires **Secret** with stored database credentials.
If needed, change values in _helm/airflow/values.yaml_.
To deploy airflow run:
```commandline
helm install <release_name> -f helm/airflow --set dockerTag=<latest_tag> 
```
##### Deploying API
Using an analogy with the previous step, you can deploy API with installed in front of it Load Balancer using:
    
    helm install <release_name> -f helm/api--set dockerTag=<latest_tag> 

In case if you need to change values, you can do it in *helm/api/values.yaml.*

API works with RDS Postgres database named sales, which consist of 8 tables normalized to 3rd normal form. API allows to create, read, update and delete records in tables sale, order_status and status_name. Also you can get records with date filter from table order_status_stats created by Airflow DAG.

***Short introduction to API endpoints:***


`get_{x}s()` - returns all records in table x

`get_{x}({x_id})` - returns record from table x with specified {x}_id if exists

`get_latest_{x}({x})` - returns last record from table x

`post_{x}({x})` - add record to table x (id generates automatically)

`put_{x}({x})` - update record in table x (if {x}_id exists)

`delete_{x}_by_id({x_id})` - delete record with specified id from table x (if {x}_id exists)

`get_order_status_stats(date_from, date_to)` - returns all records in table 
order_status_stats from date_from to date_to 

P.S. You need to change x with something from set {'sale', 'order_status', 'status_name'}
