#!/bin/bash
docker build -t oji_classification .
docker run -v "${PWD}":/var/task oji_classification
aws s3 cp oji_classification.zip s3://lambda-layers-ms
#aws lambda create-function --region ap-northeast-1 --function-name oji_classification --runtime python3.7 --role arn:aws:iam::603477195387:role/lambda-deploy-role --code S3Bucket=lambda-layers-ms,S3Key=oji_classification.zip --handler lambda_function.lambda_handler --memory-size 512 --timeout 300
aws lambda update-function-code --function-name oji_classification --s3-bucket lambda-layers-ms --s3-key oji_classification.zip --publish