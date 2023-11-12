FROM docker.elastic.co/logstash/logstash:7.17.14

COPY importData.conf /usr/share/logstash/pipeline
RUN mkdir /usr/share/logstash/data-test/
COPY testdata.json /usr/share/logstash/data-test/
COPY --chmod=0755 progress.sh /tmp
RUN bin/logstash-plugin install logstash-output-exec

ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]