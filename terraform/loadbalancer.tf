resource "yandex_alb_target_group" "lb_target_group" {
  name = "example-target-group"

  target {
    subnet_id  = yandex_vpc_subnet.subnet.id
    ip_address = yandex_compute_instance.web[0].network_interface.0.ip_address
  }
  target {
    subnet_id  = yandex_vpc_subnet.subnet.id
    ip_address = yandex_compute_instance.web[1].network_interface.0.ip_address
  }
}

resource "yandex_alb_backend_group" "lb-backend-group" {
  name = "project-backend-group"

  http_backend {
    name             = "project-http-backend"
    weight           = 1
    port             = 80
    target_group_ids = [yandex_alb_target_group.lb_target_group.id]
    load_balancing_config {
      panic_threshold = 50
    }
    healthcheck {
      timeout  = "1s"
      interval = "1s"
      http_healthcheck {
        path = "/"
      }
    }
  }
}

resource "yandex_alb_load_balancer" "project-balancer" {
  name               = "project-load-balancer"
  network_id         = yandex_vpc_network.vpc.id
  security_group_ids = [yandex_vpc_security_group.sg-balancer.id]

  allocation_policy {
    location {
      zone_id   = var.compute_default_zone
      subnet_id = yandex_vpc_subnet.subnet.id
    }
  }

  listener {
    name = "listener-http"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [80]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.lb-router.id
      }
    }
  }

  listener {
    name = "listener-https"
    endpoint {
      ports = [443]
      address {
        external_ipv4_address {
        }
      }
    }

    tls {
      default_handler {
        certificate_ids = var.certificate_ids

        http_handler {
          http_router_id = yandex_alb_http_router.lb-router.id
        }
      }
    }
  }
}

resource "yandex_alb_http_router" "lb-router" {
  name = "project-http-router"
}

resource "yandex_alb_virtual_host" "lb-virtual-host" {
  name           = "project-virtual-host"
  http_router_id = yandex_alb_http_router.lb-router.id
  route {
    name = "project"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.lb-backend-group.id
        timeout          = "3s"
      }
    }
  }
}
