# Authentication Poc

[![standard-readme compliant](https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

## Table of Contents

- [Authentication Poc](#authentication-poc)
  - [Table of Contents](#table-of-contents)
  - [Install](#install)
  - [Usage](#usage)
  - [License](#license)

## Install

Install rvm and use ruby-2.6.6

```
curl -sSL https://get.rvm.io | bash
rvm use ruby-2.6.6

```
Install the dependencies,
```
bundle install
```
Install postgresql and create the user postgres
```
create role postgres with password secret;
# All this alter can be done in single step also ? Update this.
alter role postgres with superuser;
alter role postgres with login;

```
Run the database migration and populate the seed data using following commands,
```
rails db:migration
```

## Usage

Start the rails server
```
rails s
```

## Contributing

Small note: If editing the README, please conform to the [standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

MIT © 2020
