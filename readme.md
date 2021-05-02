# AGILE WEB DEVELOPMENT WITH RAILS 6

to understand more about ruby language, check [rubyIntroduction](./rubyIntroduction.md)

### Rails CLI: 
create new project
  ```
  rails new learn-ruby-on-rails
  ```

create new controller(s)
  ```
  bin/rails generate controller Say hello goodbye
  ```

examine the installation
  ```
  bin/rails about
  windows: ruby bin\rails about
  ```

starting the server
  ```
  bin/rails server
  ```
migrate db
  ```
  bin/rails db:migrate
  ```
start seed
  ```
  bin/rails db:seed
  ```
rolling back the migration
  ```
  bin/rails db:rollback
  ```
toggle caching on/off in dev env
  ```
  bin/rails dev:cache
  ```

----------------------------------
## Chapter 18
### Where things go

  #### Top level:

  - ru for rack webserver interface
  - Gemfile is dependency list
  - lock specific version of each dependencies
  - Rakefile to define task to run tests, create documentation, extract schema structure. Type _rake -T_ for the command list, and type _rake -D task_ for specific task
  - Readme for … yeah u know what is it for

  - MVC at app
  - Bin
  - Test
  - Lib

    To hold code that doesnt fit neatly into MVC (usually contains subdir for related functionality). Use naming convention to load automatically (file name is a lowercase form of the class name). Can also use require keyword ex. _require &quot;dateFormatter&quot;._

    Lib also have tasks dir to write your own Rake tasks. Ex. rake tasks that print the vesrions listed in the schema\_migration table. Rake documentation: _https://github.com/ruby/rake#readme_

  - Logs
  - Tmp
  - Vendor
  - Public
  - Script

    For scripts that are launched from CLI ex. _console, dbconsole destroy, generate._

  - Config
  
    For environment ex. To start server command: _bin/rails server -e development_

  

### Naming conventions
  - Variables: snake case ex. phone\_number

  - Classes &amp; Modules: PascalCase ex. PhoneNumber  
  It will make assumption:

    1. db table name is snake case + plural (phone\_numbers) .
    2. Model file using snake case (phone\_number.rb)

  - Rails Controller  
    If we have a store controller:

    1. Class is PascalCase ex. StoreController, file name is snake\_case (store\_controller.rb)
    2. It will look for a helper named StoreHelper in the file store\_helper.rb located in app/helpers
    3. It will look for view templates in app/views/store
    4. Will by default take the output of these views and wrap them in the layout template contained in the file store.html.erb or store.xml.erb in the dir app/views/layouts