variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "azs" {
  description = "List of AZs to manage using only the letters, not full AZ name"
  type        = list
  default     = ["a", "b", "c", "d"]
}
