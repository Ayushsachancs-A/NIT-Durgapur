# 🧩 Infrastructure as Code (IaC) on Local Machine Using Terraform + Docker

## 🎯 Objective
Demonstrate how Infrastructure as Code (IaC) works **without cloud** by using **Terraform** to automatically create and destroy Docker containers locally.

---

## 🧰 Tools (All Free)
- **Docker Desktop** → Acts as local infrastructure (mini-cloud)
- **Terraform** → IaC engine for automating infrastructure
- **VS Code** → Write Terraform configuration

---

## 📁 Step 1 — Install Tools

### 1️⃣ Install Docker Desktop
- Download from: [https://www.docker.com/products/docker-desktop/](https://www.docker.com/products/docker-desktop/)
- Verify installation:
  ```bash
  docker ps
  ```

### 2️⃣ Install Terraform

open windows power shell in administrator mode 
```bash
> Get-ExecutionPolicy

Set-ExecutionPolicy Bypass -Scope Process -Force

`choco install terraform`

`choco install terraform`

`terraform -v`
 terraform -v
Terraform v1.13.4
on windows_amd64
PS C:\WINDOWS\system32> Set-ExecutionPolicy Bypass -Scope Process -Force; `
>> [System.Net.ServicePointManager]::SecurityProtocol = `
>> [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
>> iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```


```bash
wget https://releases.hashicorp.com/terraform/1.9.6/terraform_1.9.6_linux_amd64.zip
unzip terraform_1.9.6_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform -v
```

---

## 📁 Step 2 — Create Project Folder
```bash
mkdir terraform-docker-demo
cd terraform-docker-demo
```

---

## 📄 Step 3 — Create Terraform Configuration File

### File: `main.tf`
```hcl
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Step 1: Pull the image
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

# Step 2: Create the container using image_id
resource "docker_container" "nginx_container" {
  name  = "nginx-container"
  image = docker_image.nginx_image.image_id   # ✅ Correct attribute
  ports {
    internal = 80
    external = 8081
  }
}

```
# 🧱 Terraform with Docker – Nginx Container Example

This Terraform script automates the process of **pulling an Nginx Docker image** and **running it as a container** on your local machine — demonstrating **Infrastructure as Code (IaC)** in a fully local setup (no cloud required).

---

## 📄 Full Code

```hcl
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Step 1: Pull the image
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

# Step 2: Create the container using image_id
resource "docker_container" "nginx_container" {
  name  = "nginx-container"
  image = docker_image.nginx_image.image_id   # ✅ Correct attribute
  ports {
    internal = 80
    external = 8081
  }
}
```

---

## 🔍 Explanation (Line by Line)

### 🧩 1. Terraform Block
```hcl
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}
```
- Specifies the **provider plugin** to be used.
- `kreuzwerker/docker` → official Docker provider for Terraform.
- `version` ensures compatibility with Docker provider 3.x.
- Terraform downloads this provider automatically during initialization.

---

### ⚙️ 2. Provider Configuration
```hcl
provider "docker" {}
```
- Connects Terraform to the **local Docker daemon**.
- Default socket connection:
  - Linux/Mac: `/var/run/docker.sock`
  - Windows: `npipe:////./pipe/docker_engine`
- No credentials needed unless connecting to a remote Docker host.

---

### 🐳 3. Docker Image Resource
```hcl
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}
```
- Pulls the **Nginx image** from Docker Hub.
- `latest` refers to the newest version of Nginx.
- After apply:
  - Terraform downloads and stores the image locally.
  - The image becomes available for container creation.

---

### 🚀 4. Docker Container Resource
```hcl
resource "docker_container" "nginx_container" {
  name  = "nginx-container"
  image = docker_image.nginx_image.image_id
  ports {
    internal = 80
    external = 8081
  }
}
```
- Creates and runs a **Docker container** using the downloaded Nginx image.

| Attribute | Purpose |
|------------|----------|
| `name` | Human-readable container name (`nginx-container`). |
| `image` | Uses the image ID from the previous resource. |
| `ports` | Maps container port `80` (inside Nginx) to host port `8081`. |

Open **http://localhost:8081** → Nginx default page loads from within the container.

---

## 🧠 Terraform Workflow Summary

| Command | Purpose |
|----------|----------|
| `terraform init` | Initializes the working directory and installs providers. |
| `terraform plan` | Shows the execution plan (preview of changes). |
| `terraform apply` | Creates resources (image + container). |
| `terraform destroy` | Removes all created resources. |

---

## 🖥️ Output After Running

After applying the configuration, run:
```bash
docker ps
```

You’ll see:
```
CONTAINER ID   IMAGE          PORTS                  NAMES
a1b2c3d4e5f6   nginx:latest   0.0.0.0:8081->80/tcp   nginx-container
```

Then open:
👉 **http://localhost:8081**

---

## 🧹 Cleanup

To remove all resources created by Terraform:
```bash
terraform destroy -auto-approve
```
Terraform will:
- Stop the container
- Remove the container
- Delete the image

---

## 💡 Real-World Analogy

| Terraform Concept | Real-World Analogy |
|--------------------|--------------------|
| `terraform init` | Preparing tools before construction |
| `terraform plan` | Reviewing the blueprint |
| `terraform apply` | Building the structure |
| `terraform destroy` | Dismantling the setup |

---

## ✅ Key Takeaways

- Terraform can automate **local infrastructure** using Docker.
- Docker provider allows managing containers and images declaratively.
- Easily extend this example for multi-container setups (e.g., Nginx + MySQL).
- Your setup is **version-controlled**, **reproducible**, and **scalable**.

---

## ⚙️ Step 4 — Initialize Terraform
```bash
terraform init
```

Output:
```
- Installing kreuzwerker/docker...
- Terraform has been successfully initialized!
```

---

## ▶️ Step 5 — Plan and Apply the Code

### Preview what Terraform will do
```bash
terraform plan
```
Expected Output:
```
Plan: 2 to add, 0 to change, 0 to destroy.
```

### Apply the configuration
```bash
terraform apply -auto-approve
```
Output:
```
docker_image.nginx_image: Creating...
docker_container.nginx_container: Creating...
Apply complete! Resources: 2 added.
```

---

## ✅ Step 6 — Verify Container Creation
```bash
docker ps
```
Output:
```
CONTAINER ID   IMAGE          PORTS                  NAMES
a8d3a...       nginx:latest   0.0.0.0:8080->80/tcp   webserver
```

Now open your browser → [http://localhost:8080](http://localhost:8080)  
You should see:
> “Welcome to Nginx!”

🎉 Terraform successfully created infrastructure using **code**.

---

## 💣 Step 7 — Destroy Infrastructure
```bash
terraform destroy -auto-approve
```
Output:
```
Destroy complete! Resources: 2 destroyed.
```

---

## 🧠 How It Works Internally
| Step | Component | Action |
|------|------------|--------|
| 1 | Terraform Provider (Docker) | Talks to Docker Engine via API |
| 2 | main.tf | Describes desired infrastructure |
| 3 | terraform apply | Executes plan (creates container) |
| 4 | terraform destroy | Cleans everything automatically |

---

## 🧭 Architecture Overview

```
+-----------------------+
|   Terraform Code (.tf) |
| Defines nginx container |
+-----------+-----------+
            |
            v
+-----------------------+
|  Terraform Engine     |
| Talks to Docker API   |
+-----------+-----------+
            |
            v
+-----------------------+
|  Docker Daemon        |
| Creates Container     |
+-----------+-----------+
            |
            v
+-----------------------+
|  localhost:8080 (Nginx)|
| "Welcome" Page         |
+-----------------------+
```

---

## 🧩 Manual vs IaC Comparison

| Manual (Docker CLI) | IaC (Terraform) |
|----------------------|----------------|
| `docker run -d -p 8080:80 nginx` | Terraform code + `terraform apply` |
| Manual cleanup with `docker rm` | `terraform destroy` |
| No record of changes | Terraform state file (`terraform.tfstate`) |
| Hard to reproduce | Reproducible, version-controlled |

---

## 🧭 Summary

| Step | Action | Tool |
|------|---------|------|
| 1 | Install Docker & Terraform | Setup environment |
| 2 | Write Terraform code | Define infrastructure |
| 3 | Run `terraform apply` | Deploy container automatically |
| 4 | Access `localhost:8080` | Validate deployment |
| 5 | Run `terraform destroy` | Clean environment |

---

## 🧠 Key Takeaway
Even without cloud, **Terraform** automates **real infrastructure creation** on your **local Docker environment** — demonstrating true IaC principles:
- Repeatable  
- Version-controlled  
- Reversible  
- Fully automated  

---

**Trainer:** Gopinath Subbaian  
**Source:** ItTechGenie DevOps Specialist Training Notes  
**Topic:** IaC with Terraform + Docker (Local Demo)
