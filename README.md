For this technical challenge, I was tasked with deploying a simple RESTful microservice called "SampleApp" to a Kubernetes cluster hosted on Google Kubernetes Engine (GKE) in Google Cloud Platform (GCP). Additionally, I needed to provision related infrastructure resources for the purposes of running a GCP Cloud SQL database using Terraform.
Repository Contents:
1. Kubernetes Manifests:
Contains Kubernetes manifests for deploying the "SampleApp" microservice to a GKE cluster.
Includes deployment and service YAML files to define the microservice deployment and expose it to external traffic.
2. Terraform Configurations:
Contains Terraform configurations for provisioning the Cloud SQL instance in GCP.
Includes .tf files to define the required GCP resources such as Cloud SQL instance, database, and necessary permissions.
3. Flask app:
Flask web application written in python that exposes an endpoint returning the current date and time in UTC format.
Related dependencies needed to run the python code.
