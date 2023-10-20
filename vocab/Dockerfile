FROM python:3.8
LABEL maintainer="sswanso5@uoregon.edu"
RUN apt-get update -y
# I'm changing the order of the docker build here
# Basically, I want to cache the installation of python packages
# I do this by copying the requirements.txt first then running the pip install
# After the pip install, I copy the app into the right dir
# This way, I only run the pip install if the requirements.txt changes, and not
# if any file in the entire /app directory changes
RUN mkdir /app 
COPY ./requirements.txt /app
RUN python -m pip install -U pip
RUN pip install -r /app/requirements.txt
COPY . /app
WORKDIR /app
ENTRYPOINT ["python"]
CMD ["flask_minijax.py"]
