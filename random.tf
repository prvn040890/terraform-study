resource "random_string" "terraform-rand-id" {
  length = 6
  upper = false
  number = false
  special = false
}
