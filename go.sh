current_date=$( date '+%F_%H_%M_%S' )
docker run -it -v ${PWD}/reports/report_$current_date:/opt/jmeter/reports quay.io/centerforopenscience/performance-tests
echo "Test Results Are Available: ${PWD}/reports/report_$current_date"
