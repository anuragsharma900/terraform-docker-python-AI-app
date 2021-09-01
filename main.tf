terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>2.15.0"
    }
  }
}

provider "docker" {
 
}

# Pulls the image
resource "docker_image" "python-app" {
  name = "anuragsharma900/personality-detection"
}

# Create a container
resource "docker_container" "web-app" {
  image = docker_image.python-app.latest
  name  = "python_cont"
  ports {
    internal = 5001
    external = 5001
  }
   must_run = true
  
}
