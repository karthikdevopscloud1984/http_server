This is a simple implementation of a Ruby web server deployed on Minikube using ansible Playbook.

#***Architecture***


The ansible playbook used in this implementation builds the image and deploy minikube in your local machine if it is not running already.It then deploy the created image to minikube as deployment and expose the service as NodePort.The app can be accessed using minikube service <service name> url in the browser.
  
The K8s deployment spec used in this implementation uses Liveness and Readiness Probe which makes sure the traffic is sent only when the pod is ready and it uses pod security context with minimum previleage and run as non root user.
  
#***Steps to deploy this in local machine***:


#***Pre requisites***

Install ansible and openshift packages using pip for k8s module.

pip install ansible
pip install openshift

#***Steps***:

1. Clone this PR locally

   git clone https://github.com/karthikdevopscloud1984/http_server.git

2. Run the playbook to deploy minikube,building the image, Deploy them in minikube using 

   ansible-playbook main.yml
   
   ![image](https://user-images.githubusercontent.com/49113322/137111627-7cb358ae-0c77-490d-bf0f-6d66c2448064.png)

   
3. Once it is deployed ensure Pods and services are running using
   kubectl get all 
   Make sure ruby-web pods and service is deployed.
   
   ![image](https://user-images.githubusercontent.com/49113322/137113936-57ddc5b5-b7c6-4b9e-a01b-1b64da9628f0.png)

4. Access the web app which is deployed by setting up minikube tunnel using below command
   minikube service ruby-web --url
   
   ![image](https://user-images.githubusercontent.com/49113322/137114160-5de0244b-85fe-42fa-b582-f8b7913a9da9.png)
   
5. Access the url from above output in a browser using to access /healthcheck. If it returns OK means our web server is responding like below.
  
   ![image](https://user-images.githubusercontent.com/49113322/137114657-b7f70837-fb52-492e-8b09-49dd2fc8b828.png)
  
6. If no /healthcheck path is provided it should return "Well, hello there!" as shown below
  
   ![image](https://user-images.githubusercontent.com/49113322/137114838-452303c5-9255-4640-af3c-8ef087f38639.png)

