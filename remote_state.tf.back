data "terraform_remote_state" "supreme-robot" {
    backend = "remote"
    config = {
        organization = "knowbase"
        workspaces = {
            name = "supreme-robot"
        }
    }
}

output "remote_state" {
    value = data.terraform_remote_state.supreme-robot
}