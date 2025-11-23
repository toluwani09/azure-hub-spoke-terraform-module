variable "agent_name" {
  description = "The name of the self-hosted agent."
  type        = string
}

variable "agent_pool" {
  description = "The name of the agent pool to which the agent will be added."
  type        = string
}

variable "agent_token" {
  description = "The token used for registering the self-hosted agent."
  type        = string
}

variable "agent_work_directory" {
  description = "The working directory for the self-hosted agent."
  type        = string
  default     = "_work"
}

variable "agent_url" {
  description = "The URL of the Azure DevOps or GitHub repository."
  type        = string
}