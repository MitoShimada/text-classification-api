#!/bin/bash
docker run -v "$PWD":/var/task lambci/lambda:python3.7 lambda_function.lambda_handler '{"message":"えへへ"}'
