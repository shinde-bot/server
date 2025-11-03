<<<<<<< HEAD
# server
"Dockerized Flask sample app"
=======
# Cloud Assignment, Parts 1, 2 & 3 (Terraform + Ansible + Docker)

## Part 1: Server Provisioning with Terraform
- I used Terraform to set up an EC2 instance on AWS.
- The EC2 instance runs Ubuntu and serves as the target for configuration and deployment.
- I created a key pair (PEM file) to connect securely to the server using SSH.
- Terraform took care of creating the instance, security groups, and network setup.

## Part 2: Server Configuration with Ansible
- I automated the server setup with Ansible:
  - Updated system packages.
  - Installed Docker.
  - Configured Docker to start automatically on boot.
- I checked server connectivity with a simple Ansible ping task.

## Part 3: Docker Container Deployment
- I created a simple Python Flask web app (`app.py`) that returns "Hello from Dockerized App!"
- I added `requirements.txt` for Python dependencies.
- I created a Dockerfile to package the Flask app.
- Ansible tasks:
  - Copied the app folder to the EC2 server.
  - Built the Docker image on the server.
  - Ran the Docker container, exposing port 5000 (mapped to port 80 on the server).
- Deployed a Dockerized Flask app accessible at:
  http://ec2-13-60-3-201.eu-north-1.compute.amazonaws.com
## How to Reproduce (from WSL)
1. Make sure your PEM key is saved at `~/.ssh/tfkey.pem`.
2. Open a terminal and run:
   ```bash
   cd ~/cloud-assignment/ansible
   ansible-playbook -i hosts.ini docker_setup.yml
   ```
>>>>>>> 475ce62 (new)
