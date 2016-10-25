# Ruby docker image
This docker image is used to create and develop ruby programs.
It will install gems under project directory, so you can edit gems outside of container.

This image depends on [official ruby image](https://hub.docker.com/_/ruby/), so image tag also correspond to it.

## Supported tags and respective Dockerfile links

| tag        | link                                                                                      |
|:-----------|:------------------------------------------------------------------------------------------|
| latest     | [master/Dockerfile](https://github.com/y-takagi/ruby-docker-image/tree/master)         |
| 2.3-slim   | [2.3-slim/Dockerfile](https://github.com/y-takagi/ruby-docker-image/tree/2.3-slim)     |
| 2.3-alpine | [2.3-alpine/Dockerfile](https://github.com/y-takagi/ruby-docker-image/tree/2.3-alpine) |

## Setup
You can just use this image, but if you are using gems that depends on some packages,
you have to create another Dockerfile. Below is just a sample.

```
FROM ytakagi/ruby:latest

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
                    build-essential \
                    libpq-dev \
                    nodejs \
 && rm -rf /var/lib/apt/lists/* \
 && ln -s /usr/bin/nodejs /usr/bin/node
```

## Example

### Create Rails project

1. Create Gemfile

    ``` shellsession
    cd /path/to/project/
    touch Gemfile
    ```

    Edit Gemfile to be below.

    ``` Gemfile
    source 'https://rubygems.org'
    gem 'rails'
    ```

2. Create Dockerfile and build

    Create the same Dockerfile shown at Setup section.

    ```
    docker build -t sample-image .
    ```

3. Bundle install and Rails new

    ``` shellsession
    docker run --rm -v $(pwd):/workdir sample-image bundle install
    docker run --rm -v $(pwd):/workdir sample-image bundle exec rails new . --force --database=postgresql --skip-bundle
    ```

It's done!!

### Run Rails server
Note: you need to prepare other container such as database separately.

``` shellsession
cd /path/to/project/
docker run -v $(pwd):/workdir sample-image bundle exec rails server
```

Now you can edit Rails program (also gem) from host machine, while running Rails server at container.

Sweet!!
