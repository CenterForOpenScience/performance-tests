# performance-tests

### Prerequisite
For Macs, Docker Engine installed: https://docs.docker.com/desktop/install/mac-install/


### Running Tests

#### Run Sample Test
```source go.sh```


### Local Development

#### Building Docker Image
```docker build . --tag performance-tests-local```

#### Running Docker Image
```docker run -it -v ${PWD}/reports/report_$( date '+%F_%H_%M_%S' ):/opt/jmeter/reports performance-tests-local```
