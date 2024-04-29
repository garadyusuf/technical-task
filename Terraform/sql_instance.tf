variable "project_id" {
  default = "sandbox-400418"
}

variable "region" {
}

resource "google_sql_database_instance" "primary" {
  name         = "sampleapp"
  project      = var.project_id
  region       = var.region
  database_version = "MYSQL_8.0.31"

  settings {
    tier = "db-n2-standard-2" 
    ip_configuration {
      allowed_networks = ["ip_address>"] 
    }
    storage_auto_grow = true
    storage_allocated_storage = "10_737_418_240" 
    backup_configuration {
      enabled = true
      retention_period = "7"
    }
    user_labels = {
      availability_type = "SINGLE" 
      point_in_time_recovery = "ENABLED"
      network_throughput = "500"
      disk_throughput_read = "4.8"
      disk_throughput_write = "4.8"
      iops_read = "300"
      iops_write = "300"
    }
  }
}

resource "google_sql_database" "sampledb" {
  name         = "sampledb"
  instance      = google_sql_database_instance.primary.name
}

resource "google_sql_user" "user" {
  name         = "my-user"
  instance      = google_sql_database_instance.primary.name
  password      = "<your_strong_password>" 
  database      = google_sql_database.sampledb.name
}

output "instance_name" {
  value = google_sql_database_instance.primary.name
}

output "database_name" {
  value = google_sql_database.sampledb.name
}

output "username" {
  value = google_sql_user.user.name
  sensitive = true
}

output "password" {
  value = google_sql_user.user.password
  sensitive = true
}
