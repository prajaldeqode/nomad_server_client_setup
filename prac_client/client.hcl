data_dir = "/var/lib/nomad"

client {
  enabled = true
  network_interface = "eth0"  # Adjust this if necessary
  servers = ["172.20.0.3:4647"]  # IP address and port of the Nomad server
}

plugin "docker" {
  config {
    allow_caps = ["NET_BIND_SERVICE", "SYS_TIME"]
  }
}
