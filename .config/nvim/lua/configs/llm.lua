local M = {}

M.gemini = {
  endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
  model = "gemini-2.5-flash",
  extra_request_body = {
    temperature = 0,
    max_tokens = 50000,
  },
}

M.bedrock = {
  model = "anthropic.claude-3-sonnet-20240229-v1:0",
  aws_region = "ca-central-1",
  extra_request_body = {
    temperature = 0,
    max_tokens = 50000,
  },
}

return M
