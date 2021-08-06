# A Simple API

## Local Development (Mac/Ubuntu)

### Prerequisites

Following tools are required to be installed before you start setting up the project:
* Ruby - 2.7.0
* bundler
* Postgresql

### Setting Up the project

Clone the app and in the project directory run these commands

```
bundle install
```

After installing all the gems create the DB and run migrations:

```
rails db:create
rails db:migrate
```

In a terminal window run rails server:

```
rails s
```

### Running Test Cases

You can run the test suite with these command:

#### Back-end
```
rails test
```

You can find the documentation of the API end points in the file `New Wave Test.postman_collection.json`. This file is an export from postman so you can import it in the postman to see the documentation properly.
