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
