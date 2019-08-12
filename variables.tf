variable "aws-region" {
  type        = "string"
  description = "The AWS Region to deploy EKS"
}

variable "aws-profile" {
  type    = "string"
}


variable "dynamodb" {
  type = list(object({
    db_name = string
    billing_mode = string
    read_capacity = number
    write_capacity = number
    hash_key = string
    range_key = string
    dynamodb_attributes = list(map(string))
    tags = string
    ttl_enabled = bool
    global_secondary_index = list(object({
      name = string
      hash_key = string
      range_key = string
      write_capacity = number
      read_capacity = number
      projection_type = string
      non_key_attributes = list(string)
      }))
    local_secondary_index = list(object({
      name = string
      range_key = string
      projection_type = string
      non_key_attributes = list(string)
      }))
    }))
  default = []
}
