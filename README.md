DOCKER

Docker build images

``` docker-compose build ```

Start the docker image in the background

``` docker-compose up -d ```

Create compose database

``` docker-compose exec app bundle exec rake db:create ```

Migrate compose database

```docker-compose exec app bundle exec rake db:migrate ```