[![Codacy Badge](https://app.codacy.com/project/badge/Grade/fcb1a4c12f8c4c3b844e2a617a3744b6)](https://www.codacy.com/gh/nejdetkadir/letgo-clone/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=nejdetkadir/letgo-clone&amp;utm_campaign=Badge_Grade)

# Letgo Clone
It is a clone application of [Letgo](https://www.letgo.com/), created with Ruby on Rails & VueJS

![logo](doc/logo.png)

# Installation
## Prerequisites
- [Ruby](https://rvm.io/)
- [NodeJS (>=10.x)](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)
- [Yarn](https://yarnpkg.com/lang/en/docs/install/#debian-stable)
- [PostgreSQL](https://www.postgresql.org/download/)
- [ImageMagick](https://imagemagick.org/) `sudo apt-get install imagemagick libmagickcore-dev libmagickwand-dev`

## Installation
- Install GEM dependencies:

  ```bash
  bundle install
  ```

- Install asset dependencies:

  ```bash
  yarn install
  ```

- Create database, migrate tables and run the seed data:

  ```bash
  rails db:create
  rails db:migrate
  rails db:seed
  ```

- If you are setting up again, when you already have previous databases:

  ```bash
  rails db:reset
  ```
- For dropping database
  ```bash
  rails db:drop
  ``` 

# LICENSE
```
GNU GENERAL PUBLIC LICENSE Version 3
```