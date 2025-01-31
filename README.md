# EC2 Instance Automation Scripts

This repository contains shell scripts to automate the starting and stopping of an EC2 instance using AWS CLI. These scripts allow you to schedule instance management tasks like starting and stopping your instance at specific times.

## Prerequisites

Before you can use these scripts, make sure you have the following:

- **AWS CLI** installed on your local machine.
- **IAM credentials** with appropriate permissions to start and stop EC2 instances.
- The **EC2 instance ID** that you want to automate.

### 1. Install AWS CLI

Ensure AWS CLI is installed on your machine by following the [AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).

### 2. Configure AWS CLI

Once the AWS CLI is installed, configure it with your credentials:

```bash
aws configure
```

You will need to provide:

- AWS Access Key
- AWS Secret Key
- Default region (e.g., `us-west-2`)
- Output format (e.g., `json`)

### 3. EC2 Instance ID

You will need to note down the EC2 instance ID for the instance you wish to control. You can find this in the EC2 Dashboard under **Instances**.

---

## Script Usage

### 1. Start Script

To create a script that starts the EC2 instance, create a shell script named `start_instance.sh`:

```bash
#!/bin/bash

# Replace with your instance ID
INSTANCE_ID="your-instance-id"

# Start the instance
aws ec2 start-instances --instance-ids $INSTANCE_ID --output text

# Optional: Check instance state
aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[].Instances[].State.Name" --output text
```

Make the script executable:

```bash
chmod +x start_instance.sh
```

### 2. Stop Script

To create a script that stops the EC2 instance, create another shell script named `stop_instance.sh`:

```bash
#!/bin/bash

# Replace with your instance ID
INSTANCE_ID="your-instance-id"

# Stop the instance
aws ec2 stop-instances --instance-ids $INSTANCE_ID --output text

# Optional: Check instance state
aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[].Instances[].State.Name" --output text
```

Make this script executable:

```bash
chmod +x stop_instance.sh
```

---

## Automate the Scripts with Cron

You can automate the execution of these scripts using `cron`:

1. Open the cron editor:

   ```bash
   crontab -e
   ```

2. Add the following lines to schedule the scripts:
   
   - Start the instance at 9:00 AM:

     ```bash
     0 9 * * * /path/to/start_instance.sh
     ```

   - Stop the instance at 8:00 PM:

     ```bash
     0 20 * * * /path/to/stop_instance.sh
     ```

3. Save and exit the editor.

### 3. Test the Scripts

You can manually test the scripts to verify they work as expected:

```bash
./start_instance.sh
./stop_instance.sh
```

---

## Notes

- Replace `your-instance-id` in the scripts with the actual EC2 instance ID.
- Ensure the scripts have execution permissions using `chmod +x`.
- The cron scheduler uses a 24-hour format, so 8:00 PM is 20:00.
- These scripts will start and stop your EC2 instance automatically based on the cron schedule.

---
