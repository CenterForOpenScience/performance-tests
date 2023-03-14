# performance-tests

## Prerequisites
For Macs, Docker Engine installed: https://docs.docker.com/desktop/install/mac-install/

## Building Docker Image
docker build . --tag jmeter

## Running Docker Image
docker run -it -v ${PWD}/reports/report_$( date '+%F_%H_%M_%S' ):/opt/jmeter/reports jmeter
