# One Bit Code Exchange

This app was developed in the __One Bit Code Bootcamp 2__ and it's goal is to make the exchange between two currencies using the [Fixer API](http://fixer.io/).

## Demo
[This link](https://onebitcodeexchange.herokuapp.com/) shows my version off the app

## Getting Started

This instructions will give you a copy of the project on your local machine for development and testing.

### Installing

#### Using Docker
```
git clone https://github.com/luiswitz/onebitcode_exchange.git
cd onebitcode_exchange
docker-compose build
docker-compose up
```

#### Localhost
```
git clone https://github.com/luiswitz/onebitcode_exchange.git
cd onebitcode_exchange
bundle install
rails s
```

### Testing

#### Using Docker
In the project folder
```
docker-compose run --rm website rspec
```

#### Localhost
In the project folder
```
rspec
```
