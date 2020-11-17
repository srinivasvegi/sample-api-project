# this is an official Python runtime, used as the parent image
#FROM python:3.6.5-slim
#
## set the working directory in the container to /app
#WORKDIR /app
#
## add the current directory to the container as /app
#ADD . /app
#
## execute everyone's favorite pip command, pip install -r
#RUN pip install --trusted-host pypi.python.org -r requirements.txt
#
## unblock port 80 for the Flask app to run on
#EXPOSE 80
#
## execute the Flask app
#CMD ["python", "app.py"]


FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3-pip python3-dev

WORKDIR /app

ADD . /app

COPY requirements.txt /app/requirements.txt

RUN pip3 install -r /app/requirements.txt

COPY . /app

#ENTRYPOINT [ "python3" ]
EXPOSE 80

CMD [ "python3","/app/app.py" ]

###########################