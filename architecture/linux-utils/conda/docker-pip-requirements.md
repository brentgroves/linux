https://dev.to/behainguyen/python-docker-image-build-install-required-packages-via-requirementstxt-vs-editable-install-572j

# syntax=docker/dockerfile:1

FROM python:3.10.5-slim-buster

WORKDIR /app_demo

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0" ]