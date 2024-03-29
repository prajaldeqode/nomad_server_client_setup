job "example-job" {
  datacenters = ["dc1"]
  
  group "example-group" {
    task "example-task" {
      driver = "docker"
      
      config {
        image = "nginx:latest"
        ports = ["http"]
      }
      
      resources {
        cpu    = 500 # 500 MHz
        memory = 128 # 128MB
      }
    }
  }
}