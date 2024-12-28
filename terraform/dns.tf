resource "yandex_dns_zone" "zone" {
  name   = "dns-zone"
  zone   = var.domain_name
  public = true
}

resource "yandex_dns_recordset" "a_record" {
  zone_id = yandex_dns_zone.zone.id
  name    = var.subdomain_name
  type    = "A"
  ttl     = 300
  data    = [yandex_alb_load_balancer.project-balancer.listener[0].endpoint[0].address[0].external_ipv4_address[0].address]
}

