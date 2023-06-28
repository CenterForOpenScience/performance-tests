#!/bin/bash

git clone https://github.com/CenterForOpenScience/performance-tests \
  && mkdir -p reports \
  && jmeter -n -t performance-tests/tests/osf-test-plan.jmx -l reports/results.jtl -e -o reports
