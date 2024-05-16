## Teammates
- Louis Chang (hungyic)
- Jimmy Chang (jihrennc)

## Resources
- **Video Demo**: For a video demonstration of the application, please visit [this Google Drive link](https://drive.google.com/drive/folders/1oVFXrbv8m2nytOZ4gc-cF8jJaxQso-z4?usp=sharing).
- p.s. There's a problem that results from instable pods service of Jenkins at 12:20 of the video. It might looks like some errors at first, but it works correctly after we refreshed the webpage. It can be proved at 9:41 of the video, which is the part of the normal situation of Jenkins. 
  
- **Container Images**:    
  a. For jenkins/jupyternotebook/spark, please refer to my docker hub  [here](https://hub.docker.com/repository/docker/jihrennc/finalproject/general).     
  b. For sonarqube, please refer to this image "louischang/sonarqube1.0:latest"  [here](https://hub.docker.com/u/louischang)       
  c. For Hadoop please take the reference from this registry        
      - NameNode: [hadoop-namenode](https://hub.docker.com/r/bde2020/hadoop-namenode)        
      - DataNode: [hadoop-datanode](https://hub.docker.com/r/bde2020/hadoop-datanode).        
      - HDFS Cluster: [repository](https://github.com/big-data-europe/docker-hadoop/tree/master).    
      Adjust the docker-compose.yml to set up 2 datanodes each with distinct volumes.  
      Use Kompose to transform the docker-compose.yml into multiple YAML files and applied on Hadoop GKE deployment.



## Steps to Use This Application
1. **Install Terraform**: Ensure Terraform is installed on your local machine.
2. **Clone This Repository**: Get a copy of this repository to your local environment.
3. **Create a GCP Project**: Set up a new project on Google Cloud Platform (GCP).
4. **Configure IndexPage.js**: Change the URL in `IndexPage.js` to the fixed external IP and Docker build the driver image.
5. **Project Configuration**: Replace the project ID, zone, and credentials with your project information.
6. **External IP Configuration**: Place your service's external IP in each respective resource block.
7. **Terraform Initialization and Application**:
    - Ensure Terraform is installed locally. Then, directly enter the following commands:
      ```
      terraform init
      terraform plan
      terraform apply
      ```
    After completing step 7, your service should be running in the cloud.

8. **SonarQube Server Token Settings**:
   a. Visit your SonarQube server and navigate to **My Account > Security > Generate Token**.
   b. Copy the generated token. This will be used to set up Jenkins for communication with SonarQube.

9. **Jenkins SonarQube Setup**:    
   a. Go to **Managed Jenkins > Credentials > Add Credentials**.   
   b. Select **Text Secrets** and paste the token generated by SonarQube.    
   c. With the SonarQube scanner plugin automatically added, navigate to **Managed Jenkins > Systems > SonarQube Servers** and fill in the name and IP of your SonarQube server. Use the token from step 8b.

10. **Build Your Jenkins Pipeline**:
    - Set up your pipeline based on your requirements. In this demo, we build Maven, git clone from GitHub, and execute a SonarQube scan. Please refer to Jenkinsfile examples to build your own pipeline.

11. **Run the Pipeline**:
    - Execute the pipeline. The scan should be successfully performed, and the results can be found on your SonarQube pages.