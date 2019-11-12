#!/bin/sh
aws configure set aws_access_key_id ${AWS_ID}
aws configure set aws_secret_access_key ${AWS_KEY}
aws configure set default.region ${AWS_REGION}
