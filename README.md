Build from file
================
docker build -t pydebug-3.7 --build-arg VERSION=3.7.1 --build-arg 1001 .
docker run -itd --name pydebug-3.7.1
