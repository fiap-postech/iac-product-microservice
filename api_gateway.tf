resource "aws_apigatewayv2_integration" "apigw_integration" {
  api_id                 = data.aws_apigatewayv2_api.tech_challenge_api.id
  integration_type       = local.api_gateway.integration.integration_type
  integration_uri        = aws_lb_listener.listener_http.arn
  integration_method     = local.api_gateway.integration.integration_method
  connection_type        = local.api_gateway.integration.connection_type
  connection_id          = data.aws_apigatewayv2_vpc_link.gateway_vpc_link.id
  payload_format_version = local.api_gateway.integration.payload_format_version

  depends_on = [
    aws_lb_listener.listener_http
  ]
}

resource "aws_apigatewayv2_route" "apigw_route" {
  api_id             = data.aws_apigatewayv2_api.tech_challenge_api.id
  route_key          = "ANY /product/{proxy+}"
  authorization_type = "CUSTOM"
  authorizer_id      = "c4bsdk"
  target             = "integrations/${aws_apigatewayv2_integration.apigw_integration.id}"
  depends_on = [
    aws_apigatewayv2_integration.apigw_integration
  ]
}