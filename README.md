# Docker in Docker with gradle

Docker in docker with Gradle. Used for CI.

## Usage

1. **Trivial**: If you do not want/need to create your own special gradle-jdk combo, feel free to grab any of the images that we have created and pushed over the years here https://hub.docker.com/r/dtforce/dind-gradle/tags

2. **Easy (still)**: If none of our combos suit your needs, find the base image with Gradle, OS and JDK combo you would like to use here https://hub.docker.com/_/gradle/ & see the `Howto` section bellow.

## Howto (with example)

Example based on Gradle 8.14.4 with Alpine Linux and JDK 21

1. Touch the `Dockerfile` in this repo accordingly (i.e. use `gradle:8.14.4-jdk21-alpine` in `FROM`)

2. Build and push (change the `dtforce` for your own dockerhub organization)

```shell
docker build . -t dtforce/dind-gradle:v8.14.4-alpine-jdk21-py
docker push dtforce/dind-gradle:v8.14.4-alpine-jdk21-py
```

**Mac Silicon (Apple M-series) note:** On ARM64 machines, `docker build` produces ARM64 images by default. CI environments typically require AMD64 images. Use `buildx` to target the correct platform:

```shell
docker buildx build --platform linux/amd64 . -t dtforce/dind-gradle:v8.14.4-alpine-jdk21-py --push
```

3. Use the built image in you CI/CD pipeline and enjoy
