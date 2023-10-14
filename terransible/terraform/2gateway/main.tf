terraform {
  required_providers {
    idcloudhost = {
      source  = "bapung/idcloudhost"
      version = "0.1.3"
    }
  }
}

provider "idcloudhost" {
  # Configuration options
  auth_token = "mTWvAHka6YmhUncBxKZyCpeL40C7Kyc0"
}

resource "idcloudhost_vm" "gateway" {
  name           = "ditoihkam-gateway"       # Tambahkan tanda kutip ganda yang hilang di bagian ini
  os_name        = "ubuntu"
  os_version     = "20.04"
  vcpu           = "2"
  memory         = "1024"
  disks          = "20"
  username       = "ditoihkam"
  initial_password = "Katasand1"    # Tambahkan tanda kutip ganda yang hilang di bagian ini
  public_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCvUAXqDaDV+LKmXjvhuHHCsd4YqmZmcOE7Ry0Bb2yP3K8XIuyCO2s8ogV+0or+Je7yRGxFynDP5TSEeUsK7oDngE4W1p9fdFGelK9jVvct6N0xYm8e6ynviMRMjzwHDsyjPPC7vu2a3nMSfobYxLFQ7qI3Kr4NW0vmLuOGtPl1P9l7pncplwuZKlYl1bLT0dMrH4TFthaY0HOUhXwbNIZDBGv+10qke97DD0Dy1scBN/+HdtY2EPQeFkldD309kptZmauI/SHALoes+kL7tZQDxz5JoHdQffbfg++4wGes1uXxm3LFFfO6V6iXNuwscQmfHOvMAYXICsqDLcDkE4NW4EWrR2J5uk3l8B77au0Nf+zYwNohCesAcHLNcYiEGf9YwXnDEJ7q2m1Xh+2rpHeVX0JUVtrt5WMUJwEtTLtv6OhsAzTPAHKoBv8qIcTeuVaznOQbdRqCxCDFQtFZC9T4kQwVXWpE8Ww43m3s5/hMFveP0b7UYLdKlaX047U9Aic= ditoihkamp@Ditoihkam"
  billing_account_id = "1200157626"
}

resource "idcloudhost_floating_ip" "ipdua" {
  name              = "gatewayIP"
  billing_account_id = "1200157626"
  assigned_to       = idcloudhost_vm.gateway.id  # Koreksi nama atribut dan tambahkan ".gateway"
}
