FROM spark
USER root
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh && /setup.sh
ENV PATH="/opt/spark/bin:${PATH}"
ENV HADOOP_HOME="/opt/spark/work-dir/hadoop-3.3.4"
ENV JAVA_HOME="/opt/java/openjdk"
ENV PATH="${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin"
ENV PYSPARK_DRIVER_PYTHON="jupyter"
ENV PYSPARK_DRIVER_PYTHON_OPTS='notebook --no-browser --port=8888 --ip=0.0.0.0 --allow-root'

