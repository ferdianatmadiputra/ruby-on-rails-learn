# Unit Testing
## Syntax
  - test...do
  - assert  
    a test. all it does is test that an argument is true. if args is false, the assertion fails. Second params is used as error message if the assertion fails so it can be used to diagnose what went wrong.
  - errors & invalid?
    check to see if it validates. in errors, you could use any? to see if an error is associated with a particular attributes.
  - assert_equal
    compare two values

## Test Fixtures
  - fixture is an environment in which you can run a test
  - it is a specification of the initial contents of model(s) under test
  - stored in the test/fixtures directory in YAML format
  - the name of the fixture file must match the name of a database table