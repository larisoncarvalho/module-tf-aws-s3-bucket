module "role_0eu096k_9ci2y0p" {
  source = "./modules/iam_role"

  name                 = "0eu096k-9ci2y0p"
  path                 = "/"
  max_session_duration = 3600
  assume_role_policy_document = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = [
            "lambda.amazonaws.com",
            "edgelambda.amazonaws.com"
          ]
        }
        Action = "sts:AssumeRole"
      }
    ]
  }
  inline_policies = {
    policy_1 = {
      policy_name = "0eu096k-9ci2y0p-policy"
      policy_document = {
        Version = "2012-10-17"
        Statement = [
          {
            Effect = "Allow"
            Action = [
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:PutLogEvents"
            ]
            Resource = "*"
          },
          {
            Effect = "Allow"
            Action = [
              "s3:GetObject",
              "s3:PutObject"
            ]
            Resource = "arn:aws:s3:::xstack-landing-nonprod/*"
          }
        ]
      }
    }
  }
}

module "role_0eu096k_ing4i1" {
  source = "./modules/iam_role"

  name                 = "0eu096k-ing4i1"
  path                 = "/"
  max_session_duration = 3600
  assume_role_policy_document = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = [
            "lambda.amazonaws.com",
            "edgelambda.amazonaws.com"
          ]
        }
        Action = "sts:AssumeRole"
      }
    ]
  }
  inline_policies = {
    policy_1 = {
      policy_name = "0eu096k-ing4i1-policy"
      policy_document = {
        Version = "2012-10-17"
        Statement = [
          {
            Effect = "Allow"
            Action = [
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:PutLogEvents"
            ]
            Resource = "*"
          },
          {
            Effect = "Allow"
            Action = [
              "s3:GetObject",
              "s3:PutObject"
            ]
            Resource = "arn:aws:s3:::xstack-landing-nonprod/*"
          }
        ]
      }
    }
  }
}

module "role_1z1sf45_3rieapj" {
  source = "./modules/iam_role"

  name                 = "1z1sf45-3rieapj"
  path                 = "/"
  max_session_duration = 3600
  assume_role_policy_document = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = [
            "lambda.amazonaws.com",
            "edgelambda.amazonaws.com"
          ]
        }
        Action = "sts:AssumeRole"
      }
    ]
  }
  inline_policies = {
    policy_1 = {
      policy_name = "1z1sf45-3rieapj-policy"
      policy_document = {
        Version = "2012-10-17"
        Statement = [
          {
            Effect = "Allow"
            Action = [
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:PutLogEvents"
            ]
            Resource = "*"
          },
          {
            Effect = "Allow"
            Action = [
              "s3:GetObject",
              "s3:PutObject"
            ]
            Resource = "arn:aws:s3:::xstack-landing-nonprod/*"
          }
        ]
      }
    }
  }
}

module "role_1z1sf45_zflgrfp" {
  source = "./modules/iam_role"

  name                 = "1z1sf45-zflgrfp"
  path                 = "/"
  max_session_duration = 3600
  assume_role_policy_document = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = [
            "lambda.amazonaws.com",
            "edgelambda.amazonaws.com"
          ]
        }
        Action = "sts:AssumeRole"
      }
    ]
  }
  inline_policies = {
    policy_1 = {
      policy_name = "1z1sf45-zflgrfp-policy"
      policy_document = {
        Version = "2012-10-17"
        Statement = [
          {
            Effect = "Allow"
            Action = [
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:PutLogEvents"
            ]
            Resource = "*"
          },
          {
            Effect = "Allow"
            Action = [
              "s3:GetObject",
              "s3:PutObject"
            ]
            Resource = "arn:aws:s3:::xstack-landing-nonprod/*"
          }
        ]
      }
    }
  }
}

module "role_498i03_s0g5wv" {
  source = "./modules/iam_role"

  name                 = "498i03-s0g5wv"
  path                 = "/"
  max_session_duration = 3600
  assume_role_policy_document = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = [
            "lambda.amazonaws.com",
            "edgelambda.amazonaws.com"
          ]
        }
        Action = "sts:AssumeRole"
      }
    ]
  }
  inline_policies = {
    policy_1 = {
      policy_name = "498i03-s0g5wv-policy"
      policy_document = {
        Version = "2012-10-17"
        Statement = [
          {
            Effect = "Allow"
            Action = [
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:PutLogEvents"
            ]
            Resource = "*"
          },
          {
            Effect = "Allow"
            Action = [
              "s3:GetObject",
              "s3:PutObject"
            ]
            Resource = "arn:aws:s3:::xstack-landing-nonprod/*"
          }
        ]
      }
    }
  }
}

module "user_data" {
  source = "./modules/subnet"

  vpc_id                          = "vpc-0119b9388f2104572"
  cidr_block                      = "10.0.0.128/27"
  availability_zone               = "eu-central-1a"
  assign_ipv6_address_on_creation = false
  ipv6_cidr_block                 = "2a05:d014:190:c680::/64"
  map_public_ip_on_launch         = false
  tags = {
    Name          = "user-data"
    Resource-Type = "nonprod"
  }
}