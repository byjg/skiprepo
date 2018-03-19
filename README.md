## Hello World! (WAR-style)

This is the simplest possible Java webapp for testing servlet container deployments.  
It should work on any container and requires no other dependencies or configuration.

The hello world project was forked from https://github.com/efsavage/hello-world-war.git because
there is no necessary a full solution for a Proof of Concept

## Specific changes

[![Build Status](https://travis-ci.org/byjg/skiprepo.svg?branch=master)](https://travis-ci.org/byjg/skiprepo)

This project adds a Dockerfile and the .travis.yml necessary for build the project using the CI platform

### Build

```bash
docker run -it --rm --name my-maven-project \
    -v "$(pwd)":/usr/src/mymaven \
    -v "$(pwd)/.m2":/root/.m2 \
    -w /usr/src/mymaven \
maven:3.3-jdk-8 mvn install
```
