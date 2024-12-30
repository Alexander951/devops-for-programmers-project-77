resource "yandex_vpc_network" "vpc" {
  name = "yc-web-vpc"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "yc-web-subnet"
  zone           = var.compute_default_zone
  network_id     = yandex_vpc_network.vpc.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_compute_instance" "web" {
  count = 2

  name = "yc-web-server-${count.index}"
  zone = var.compute_default_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd82vchjp2kdjiuam29k"
      size     = 20
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.subnet.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.sg-vms.id]
  }

  metadata = {
    install-unified-agent = 0
    serial-port-enable    = 0
    ssh-keys              = "${var.vm_user}:${var.admin_ssh_key}"
    user-data = <<-EOF
    #cloud-config
    datasource:
     Ec2:
      strict_id: false
    ssh_pwauth: no
    users:
    - name: ${var.vm_user}
      sudo: ALL=(ALL) NOPASSWD:ALL
      shell: /bin/bash
      ssh_authorized_keys:
      - ${var.admin_ssh_key}
    EOF  
  }
  depends_on = [yandex_vpc_subnet.subnet, yandex_vpc_security_group.sg-vms]
}

resource "yandex_vpc_security_group" "sg-balancer" {
  name       = "sg-balancer"
  network_id = yandex_vpc_network.vpc.id
  egress {
    protocol       = "ANY"
    description    = "any"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
  ingress {
    protocol       = "TCP"
    description    = "ext-http"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
  ingress {
    protocol       = "TCP"
    description    = "ext-https"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 443
  }
  ingress {
    protocol          = "TCP"
    description       = "healthchecks"
    predefined_target = "loadbalancer_healthchecks"
    port              = 30080
  }
}

resource "yandex_vpc_security_group" "sg-vms" {
  name       = "sg-vms"
  network_id = yandex_vpc_network.vpc.id
  ingress {
    protocol       = "TCP"
    description    = "balancer1"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol       = "TCP"
    description    = "ssh"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }
  egress {
    protocol       = "ANY"
    description    = "any"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}


