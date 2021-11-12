#!/usr/bin/env bash

mvn clean package
echo 'Copy files...'

scp -i ~/.ssh/sweater-london.pem \
    target/TimeTrackingSystem-0.0.1-SNAPSHOT.jar \
    ec2-user@ec2-18-132-196-105.eu-west-2.compute.amazonaws.com:/home/ec2-user/

scp -i ~/.ssh/sweater-london.pem \
    scripts/cacerts \
    ec2-user@ec2-18-132-196-105.eu-west-2.compute.amazonaws.com:/home/ec2-user/.sdkman/candidates/java/current/lib/security

echo 'Restart server...'

ssh -i ~/.ssh/sweater-london.pem ec2-user@ec2-18-132-196-105.eu-west-2.compute.amazonaws.com << EOF

pgrep java | xargs kill -9
nohup java -jar TimeTrackingSystem-0.0.1-SNAPSHOT.jar > log.txt &
EOF
echo 'Bye'