# Bundler docker image
This container image is used to create and develop ruby programs.

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

2. Bundle install

    ``` shellsession
    docker run --rm -v $(pwd):/workdir ytakagi/bundler bundle install
    ```

It's done!!

### Run Rails server

``` shellsession
cd /path/to/project/
docker run -v $(pwd):/workdir ytakagi/bundler bundle exec rails server
```

Now you can edit Rails program (also gem) from host machine, while running Rails server at container.
Sweet!!
