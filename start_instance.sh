#!/bin/bash

# Replace with your instance ID
INSTANCE_ID="your-instance-id"

# Start the instance
aws ec2 start-instances --instance-ids $INSTANCE_ID --output text

# Optional: Check instance state
aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[].Instances[].State.Name" --output text
