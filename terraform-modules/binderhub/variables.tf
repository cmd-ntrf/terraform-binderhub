variabe "ip" {
  description = "ip address of the master"
}
variable "domain" {
  description = "Domain name"
}

variable "TLS_email" {
  description = "Email address used to register TLS certificate"
}

variable "mem_alloc_gb" {
  description = "RAM allocation per user"
}

variable "cpu_alloc" {
  description = "CPU allocation per user (floating point values are supported)"
}

variable "admin_user" {
  description = "User with root access"
}

variable "private_key_path" {
  description = "Path to private key file"
}

variable "docker_id" {
  description = "Docker hub username"
}

variable "docker_password" {
  description = "Docker hub password"
}
