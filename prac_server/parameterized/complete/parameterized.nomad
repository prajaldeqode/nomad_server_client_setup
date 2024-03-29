## These variables allow the job to have overridable default values
## for datacenter and driver.

variable "datacenter" {
  ## set the `NOMAD_VAR_datacenter` environment variable to override
  type = string
  default = "dc1"
}

variable "driver" {
  ## set the `NOMAD_VAR_driver` environment variable to override
  type = string
  default = "raw_exec"
  validation {
    condition = var.driver == "raw_exec" || var.driver == "exec"
    error_message = "Invalid value for driver; valid values are: raw_exec, exec."
  }
}

job "template" {
  datacenters = [var.datacenter]
  type = "batch"

  parameterized {

  }

  group "renderer" {
    task "output" {
      driver = var.driver

      config {
        command = "cat"
        args = ["local/out.txt"]
      }

      template {
        destination = "local/out.txt"

## The HCL2 `file` function allows you to split out the template
## into its own file. When you issue the `nomad job run` command,
## the HCL2 engine inserts the files contents directly in place
## before the job is submitted to Nomad.

        data =<<EOT
${file("./template.tmpl")}
EOT
      }
    }
  }
}
