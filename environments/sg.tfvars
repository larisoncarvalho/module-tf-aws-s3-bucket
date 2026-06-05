region = "ap-southeast-1"
name   = "stulyze-app"
template_body = <<EOT
{
  "Outputs": {
    "StulyzeResourceTableName": {
      "Value": { "Ref": "StulyzeResourceTable" }
    }
  },
  "Resources": {
    "StulyzeResourceTable": {
      "Type": "AWS::DynamoDB::Table",
      "Properties": {
        "AttributeDefinitions": [
          { "AttributeName": "ParentId", "AttributeType": "S" },
          { "AttributeName": "ResourceId", "AttributeType": "S" }
        ],
        "KeySchema": [
          { "AttributeName": "ParentId", "KeyType": "HASH" },
          { "AttributeName": "ResourceId", "KeyType": "RANGE" }
        ],
        "ProvisionedThroughput": {
          "ReadCapacityUnits": 5,
          "WriteCapacityUnits": 5
        }
      }
    }
  }
}
EOT
disable_rollback   = false
timeout_in_minutes = 0