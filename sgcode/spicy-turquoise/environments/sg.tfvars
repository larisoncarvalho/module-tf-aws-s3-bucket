region                                  = "eu-central-1"
ami                                     = "ami-01b5c3cf789dbf1fb"
instance_type                           = "t3.micro"
availability_zone                       = "eu-central-1a"
key_name                                = "ec2-key-k3ehbblq"
subnet_id                               = "subnet-0b77c0d76befaf70d"
vpc_security_group_ids                  = ["sg-0373ac5706eeaf25d"]
source_dest_check                       = true
ebs_optimized                           = false
monitoring                              = false
tenancy                                 = "default"
capacity_reservation_preference         = "open"
metadata_http_endpoint                  = "enabled"
metadata_http_protocol_ipv6             = "disabled"
metadata_http_put_response_hop_limit    = 1
metadata_http_tokens                    = "optional"
metadata_instance_metadata_tags         = "disabled"
enclave_options_enabled                 = false
root_block_device_delete_on_termination = true
tags = {
  "drifttest" = "true"
}
user_data = <<-EOT
  #!/bin/bash
  
  cat > /usr/local/bin/auto-shutdown.sh << 'SCRIPT'
  #!/bin/bash
  IDLE_FILE="/tmp/idle-minutes"
  THRESHOLD_MINUTES=$${IDLE_THRESHOLD:-240}
  CPU_THRESHOLD=$${CPU_THRESHOLD:-5}
  
  [ ! -f "$IDLE_FILE" ] && echo 0 > "$IDLE_FILE"
  
  SSH_USERS=$(who | wc -l)
  CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d. -f1)
  
  if [ "$SSH_USERS" -eq 0 ] && [ "$CPU_USAGE" -lt "$CPU_THRESHOLD" ]; then
    CURRENT=$(cat "$IDLE_FILE")
    CURRENT=$((CURRENT + 1))
    echo "$CURRENT" > "$IDLE_FILE"
    if [ "$CURRENT" -ge "$THRESHOLD_MINUTES" ]; then
      shutdown -h now
    fi
  else
    echo 0 > "$IDLE_FILE"
  fi
  SCRIPT
  
  chmod +x /usr/local/bin/auto-shutdown.sh
  
  echo "* * * * * root IDLE_THRESHOLD=240 CPU_THRESHOLD=5 /usr/local/bin/auto-shutdown.sh" > /etc/cron.d/auto-shutdown
  chmod 644 /etc/cron.d/auto-shutdown
EOT