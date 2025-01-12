### Final Java DevOps CI/CD project.

## Description 

This is a simple Java web app that needs to have an automated CI/CD using the DevOps toolset.

## The used tools

- Git/Github
- Maven
- Docker 
- Jenkins 
- Ansible 
- Terraform (Plus) 
- AWS (plus)

## The requirements

CI/CD pipeline that do as following 

CI:
- Clone the source code.
- Build the code using mvnw (already in the repo)
- Test the code using mvnw (already in the repo)
- Dockerize the application and push it to dockerhub

CD:
- Deploy the application by running a container from the image using Ansible.