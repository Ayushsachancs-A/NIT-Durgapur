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
