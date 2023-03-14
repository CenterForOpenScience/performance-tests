#!/bin/bash
#
git clone https://github.com/CenterForOpenScience/performance-tests \
  && ls \
  && jmeter -n -t performance-tests/osf-test-plan.jmx
