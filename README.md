Employee Monthly Payslip
========================

## Assumptions

Base on [Test Assignment](TEST_ASSIGNMENT.md) here, even though the app is call `monthly payslip`, but I assume that the app will show payslip of calendar month by given `payment start date`, and remove the extract dates.
For example, if the `payment start date` is `01 March - 15 May`, it will show 2 month salary, and the payslip is between `01 March - 30 April`, because 15 May is not the pay day. This example file is in `spec/fixtures/test2.csv`.

## Prerequisites

- bundler
- Ruby 2.3+
- sqlite
- phantomjs

## Installation

1. Install sqlite
   `brew install sqlite`
2. Install phantomjs
   `brew install node && npm install phantom phantomjs -g`
3. `bundle install`
4. Run db rake tasks
   `rake db:drop db:create db:migrate db:seed`
5. Run rails application
   `rails server`
6. Open the web browser and point to app
   `open http://localhost:3000`

## Usage

1. Create a test file. I've create some fixtures for your in `spec/fixtures/` folder.
2. Open the web browser and point to app.

## Test Suite

    $ rake

### Test Coverage

If you would like a report of the test coverage, open "coverage/index.html" after running following task:

    $ rake

Because there are some files created by `rails new` command and they are not test covered, the test coverage is not 100%. All the others have already been test covered.
