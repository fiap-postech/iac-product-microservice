locals {
  api_gateway = {
    id = "5v9oztrfzi"

    vpc_link = {
      id = "9dorps"
    }

    integration = {
      integration_type       = "HTTP_PROXY"
      integration_method     = "ANY"
      connection_type        = "VPC_LINK"
      payload_format_version = "1.0"
    }
  }
}