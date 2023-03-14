#!/bin/bash

git clone https://github.com/CenterForOpenScience/performance-tests \
  && jmeter -n -t performance-tests/osf-test-plan.jmx -l jmeter-results.log -e -o reports
