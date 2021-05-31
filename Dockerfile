FROM centos
RUN yum install python3 -y
RUN yum install firefox -y
RUN yum install libcanberra-gtk2 -y
RUN yum install PackageKit-gtk3-module -y
CMD export DISPLAY=:0
RUN pip3 install sklearn
RUN pip3 install pandas
RUN pip3 install jupyter notebook 
CMD ["mkdir","/root/salaryprediction"]
COPY SalaryPred.ipynb SalaryData.csv  salaryPred.pk1 /root/salaryprediction/
ENV LOG_LEVEL=30 NOTEBOOK_DIR='/root/' LISTEN_IP='localhost' PORT=8888 BROWSER='firefox'
CMD jupyter notebook --allow-root --log-level $LOG_LEVEL --notebook-dir $NOTEBOOK_DIR --ip $LISTEN_IP --port $PORT --browser $BROWSER
