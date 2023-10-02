# Cash Register App - Ruby on Rails

## Introduction

Welcome to the Ruby on Rails project! This README provides essential information and guidelines for setting up and working on this project. This project is built with Ruby on Rails and some of the stack are:

- [Ruby 3.2.2](https://www.ruby-lang.org/en/downloads/)
- [rspec](https://rubygems.org/gems/rspec)
- [rubocop](https://rubygems.org/gems/rubocop)
- [I18n](https://rubygems.org/gems/i18n)
- [bootstrap](https://getbootstrap.com/)
- [faker](https://rubygems.org/gems/faker)
- [factory_bot_rails](https://rubygems.org/gems/factory_bot_rails)
- [webpacker](https://rubygems.org/gems/webpacker)

## Objective

Build an application responding to these needs.

By application, we mean:
- It has a UI, where the user is able to add products to a cart and compute the total price (it can be a simple CLI)
- It is usable while remaining as simple as possible
- It is readable
- It is maintainable
- It is easily extendable

## Technical requirements

- Use any of those languages you are comfortable (Ruby, Python, Go, .Net Core)
- Covered by tests
- Following TDD methodology

## Description

### Assumptions

**Products Registered**
  
```bash
| Product Code | Name         | Price   |  
|--------------|--------------|---------|
| GR1          | Green Tea    | 3.11€   |
| SR1          | Strawberries | 5.00 €  |
| CF1          | Coffee       | 11.23 € |
```

**Special conditions**

- The CEO is a big fan of buy-one-get-one-free offers and green tea.
  He wants us to add a  rule to do this.

- The COO, though, likes low prices and wants people buying strawberries to get a price  discount for bulk purchases.
  If you buy 3 or more strawberries, the price should drop to 4.50€.

- The VP of Engineering is a coffee addict.
  If you buy 3 or more coffees, the price of all coffees should drop to 2/3 of the original price.

Our check-out can scan items in any order, and because the CEO and COO change their minds  often, it needs to be flexible regarding our pricing rules.

**Test data**
```bash
| Basket              | Total price expected |  
|---------------------|----------------------|
| GR1,GR1             |  3.11€               |
| SR1,SR1,GR1,SR1     |  16.61€              |
| GR1,CF1,SR1,CF1,CF1 |  30.57€              |
```

## Prerequisites

Before you can get started, make sure you have the following prerequisites installed on your system:

- [Git](https://git-scm.com/downloads)
- [RVM (Ruby Version Manager)](https://rvm.io/rvm/install)
  
- Ruby 3.2.2 with RVM:
    ```bash
      rvm install 3.2.2
      rvm use 3.2.2 --default
    ```


## Installation

Follow these steps to set up the project on your local machine:

1. Clone the repository:

   ```bash
   git clone https://github.com/FrancoRodriguez/cash-register-app.git
    ```

2. Change your working directory to the project's root folder:

    ```bash
    cd cash-register-app
    ```

3. Install the required Ruby gems:

    ```bash
    bundle install
   ```
## Database Setup

This project uses a database to store and retrieve data. Follow these steps to set up the database:

1. Create the database:

   ```bash
   rails db:create
   ```

2. Run database migrations
   
    ```bash
    rails db:migrate
   ```

3. Seed the database with inital data:
    
   ```bash
    rails db:seed
   ```

## Running the Application

To start the Rails server and run the application locally, use the following command:

```bash
rails server
```

The application should now be accessible in your web browser at http://localhost:3000

## Testing

Testing is an essential part of the development process. This project uses RSpec for testing. To run the tests, use the following command:

```bash
rspec
```

