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

resource "idcloudhost_vm" "monitoring" {
  name           = "ditoihkam-monitoring"       # Tambahkan tanda kutip ganda yang hilang di bagian ini
  os_name        = "ubuntu"
  os_version     = "20.04"
  vcpu           = "2"
  memory         = "2048"
  disks          = "20"
  username       = "ditoihkam"
  initial_password = "Katasand1"    # Tambahkan tanda kutip ganda yang hilang di bagian ini
  public_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDyzr0gG8Rdt/jtTZdLwBbmvm9AFQG8sqnIbyfafbov29TKwnh+H4PSU0a/UBGtTknshi781djcAcQsMmd8zOaYP0F1Y5UURThSPH5GScoX/ZOFB9QpOPnIsyN0hFcBv/cFmBGZ4uiLvgo31FzFocThDhhgpmzM152lClvogRvx8KNEqOg1q2I7yM+KYueu5zXTTlEoKX2d+MRAIYR2FfneuUvos8iPSieXHvNsBG5d9kshBgSiWhWdZbeRarf7O1oIX1yIWs9KdJOTJnAdAdgHuXi1EV8i20+9Jqzk2uP0cSZnWwTVmNgSAKrm6BMlm0Y7kReKOlbF2IIv+IpADMWXeoyx3fgWu55zktHNmrGjTgxUVqtZP3M02t5hcA1sUx+peDTFjftwaBtwqGo9swF5aBv8uNWWNh3dK45t0zyzLj3yq/Ppn4GOlfsKkFnSZ/T09wlu9GMJmysKe1w72+rYRlOUh5mm8S08kOzahaAFWVQoYRWzoKNuJ88dUEU0XBU= ditoihkam@Ditoihkam"
  billing_account_id = "1200157626"
}

resource "idcloudhost_floating_ip" "iptiga" {
  name              = "monitoringIP"
  billing_account_id = "1200157626"
  assigned_to       = idcloudhost_vm.monitoring.id  # Koreksi nama atribut dan tambahkan ".appserver"
}
