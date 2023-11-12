#!/bin/bash

CHECK="$ELASTICSEARCH_URL/test_data/_count"
CONDITION="\"count\":10"

while [ true ]
do
   if curl -u $ELASTICSEARCH_USERNAME:$ELASTIC_PASSWORD $CHECK | grep -q "$CONDITION"; then
        #Kill Logstash so container would stop  
        kill $(ps aux | grep 'logstash' | awk '{print $2}')
        break
   else
        echo "Counting documents from Elasticsearch does not return expected number. Retrying"
        sleep 2
   fi 
done

