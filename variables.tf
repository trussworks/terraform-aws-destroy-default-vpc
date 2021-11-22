variable "azs" {
  description = "List of AZs to manage using only the letters, not full AZ name"
  type        = list(string)
  default     = ["a", "b", "c", "d"]
}
