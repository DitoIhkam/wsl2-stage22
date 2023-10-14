terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.0.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "wayshub-fe" {
  name = "kelompok2/fe-way"
  keep_locally = false
}

resource "docker_container" "wayshub-fe" {
  image = "kelompok2/fe-way"
  name  = "frontend"
  ports {
    internal = 3000
    external = 3001
  }
}
