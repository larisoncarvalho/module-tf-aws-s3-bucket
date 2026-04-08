region = "eu-central-1"

certificates = {
  int_qa_stackguardian_io = {
    domain_name                              = "*.int.qa.stackguardian.io"
    subject_alternative_names                = ["*.int.qa.stackguardian.io", "int.qa.stackguardian.io"]
    validation_method                        = "DNS"
    key_algorithm                            = "RSA_2048"
    certificate_transparency_logging_preference = "ENABLED"
    tags = {
      Resource-Type = "prod"
    }
  }
  stackguardian_io = {
    domain_name                              = "stackguardian.io"
    subject_alternative_names                = ["stackguardian.io", "*.qa.stackguardian.io", "*.stackguardian.io"]
    validation_method                        = "DNS"
    key_algorithm                            = "RSA_2048"
    certificate_transparency_logging_preference = "ENABLED"
    tags = {
      Resource-Type = "prod"
      Name          = "sg"
    }
  }
}

rest_apis = {
  platform_api_dev = {
    name                     = "platform-api-dev"
    description              = "Created automatically by Zappa."
    api_key_source           = "HEADER"
    binary_media_types       = ["*/*"]
    minimum_compression_size = 0
    tags = {
      "aws:cloudformation:stack-name"  = "platform-api-dev"
      "aws:cloudformation:logical-id"  = "Api"
      "aws:cloudformation:stack-id"    = "arn:aws:cloudformation:eu-central-1:790543352839:stack/platform-api-dev/4e52b040-614e-11ef-83b8-067f8cb51289"
      ZappaProject                     = "platform-api-dev"
    }
  }
  sg_api_qa = {
    name               = "sg-api-qa"
    api_key_source     = "HEADER"
    binary_media_types = ["application/octet-stream"]
  }
  arunim_test_api = {
    name           = "arunim-test-api"
    api_key_source = "HEADER"
  }
  github_oidc_wrapper = {
    name           = "github-oidc-wrapper"
    api_key_source = "HEADER"
    tags = {
      "aws:cloudformation:stack-name" = "github-oidc-wrapper"
      "aws:cloudformation:logical-id" = "GithubOAuthApi"
      "aws:cloudformation:stack-id"   = "arn:aws:cloudformation:eu-central-1:790543352839:stack/github-oidc-wrapper/4736a280-16c4-11f1-bf2f-02c6f78dafe9"
    }
  }
}

athena_workgroups = {
  de_manuel_meireles_primary_workgroup = {
    name                               = "de-manuel-meireles-primary-workgroup"
    description                        = "Primary Athena workgroup for de-manuel-meireles"
    state                              = "ENABLED"
    bytes_scanned_cutoff_per_query     = 10737418240
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true
    requester_pays_enabled             = false
    output_location                    = "s3://de-manuel-meireles-infra-athena-results/query-results/"
    encryption_option                  = "SSE_S3"
    selected_engine_version            = "AUTO"
    tags = {
      Architecture = "medallion"
      Environment  = "de-manuel-meireles"
      ManagedBy    = "terraform"
      Project      = "data-lake"
    }
  }
  dev_manuel_meireles_primary_workgroup = {
    name                               = "dev-manuel-meireles-primary-workgroup"
    description                        = "Primary Athena workgroup for dev-manuel-meireles"
    state                              = "ENABLED"
    bytes_scanned_cutoff_per_query     = 107374182
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true
    requester_pays_enabled             = false
    output_location                    = "s3://dev-manuel-meireles-infra-athena-results/query-results/"
    encryption_option                  = "SSE_S3"
    selected_engine_version            = "AUTO"
  }
  dev_pedro_chaves_primary_workgroup = {
    name                               = "dev-pedro-chaves-primary-workgroup"
    description                        = "Primary Athena workgroup for dev-pedro-chaves"
    state                              = "ENABLED"
    bytes_scanned_cutoff_per_query     = 107374182
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true
    requester_pays_enabled             = false
    output_location                    = "s3://dev-pedro-chaves-infra-athena-results/query-results/"
    encryption_option                  = "SSE_S3"
    selected_engine_version            = "AUTO"
    tags = {
      Architecture = "medallion"
      Environment  = "dev-pedro-chaves"
      ManagedBy    = "terraform"
      Project      = "data-lake"
    }
  }
  non_prod_primary_workgroup = {
    name                               = "non-prod-primary-workgroup"
    description                        = "Primary Athena workgroup for non-prod"
    state                              = "ENABLED"
    bytes_scanned_cutoff_per_query     = 1073741824
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true
    requester_pays_enabled             = false
    output_location                    = "s3://non-prod-infra-athena-results/query-results/"
    encryption_option                  = "SSE_S3"
    selected_engine_version            = "AUTO"
    tags = {
      Architecture  = "medallion"
      CostCenter    = "non-prod-data-lake"
      DataRetention = "short-term"
      Environment   = "non-prod"
      ManagedBy     = "terraform"
      Project       = "data-lake"
    }
  }
  primary = {
    name                               = "primary"
    state                              = "ENABLED"
    enforce_workgroup_configuration    = false
    publish_cloudwatch_metrics_enabled = false
    requester_pays_enabled             = false
    output_location                    = ""
    encryption_option                  = ""
    selected_engine_version            = "AUTO"
  }
}