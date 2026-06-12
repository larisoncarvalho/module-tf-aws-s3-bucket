region                                                 = "ap-southeast-1"
primary_workgroup_name                                 = "primary"
primary_workgroup_state                                = "ENABLED"
primary_workgroup_enforce_workgroup_configuration      = false
primary_workgroup_publish_cloudwatch_metrics_enabled   = true
primary_workgroup_requester_pays_enabled               = false
primary_workgroup_selected_engine_version              = "AUTO"
stulyze_app_stack_name                                 = "stulyze-app"
stulyze_app_stack_disable_rollback                     = false
stulyze_app_stack_template_body                        = <<-EOT
{
  "Resources": {
    "StulyzeResourceTable": {
      "Type": "AWS::DynamoDB::Table",
      "Properties": {
        "AttributeDefinitions": [
          {
            "AttributeName": "ParentId",
            "AttributeType": "S"
          },
          {
            "AttributeName": "ResourceId",
            "AttributeType": "S"
          }
        ],
        "KeySchema": [
          {
            "AttributeName": "ParentId",
            "KeyType": "HASH"
          },
          {
            "AttributeName": "ResourceId",
            "KeyType": "RANGE"
          }
        ],
        "ProvisionedThroughput": {
          "ReadCapacityUnits": 5,
          "WriteCapacityUnits": 5
        }
      }
    }
  },
  "Outputs": {
    "StulyzeResourceTableName": {
      "Value": {
        "Ref": "StulyzeResourceTable"
      }
    }
  }
}
EOT
igw_02aec4b4978ee2879_vpc_id                           = "vpc-05fed6e9ac0f64a6e"