# Introduction to Ruby

Ruby is object oriented language

## Ruby Names
- local var, method params, and method names is a lowercase case letter or with an underscoreL order, line_item, and xr2000.
- Instance var begin with an @ ex. @quantity and @product_id.
- Class names, module name and constance must start with Uppercase letter ex. Object, PurchaseOrder, and LineItem.
- Rails use symbols to indentify things. It uses them as keys when naming method params and looking things up in hashes. ex:
  ```
  redirect_to :action => "edit", :id => params[:id]
  ```

- Methods example:
    ```
    def​ ​say_goodnight​(name)
      result = ​'Good night, '​ + name
      ​return​ result
    ​end​
    # Time for bed...​
      puts say_goodnight(​'Mary-Ellen'​) ​# => 'Goodnight, Mary-Ellen'​
      puts say_goodnight(​'John-Boy'​)   ​# => 'Goodnight, John-Boy'​
    ```
  ### Notes: 
  - Ruby doesnt use brace, use 'end' keyword instead.
  - 'return' keyword is optional, if its not present, the return value is the results of the last expression.



## Data Types
everything in Ruby is an object, but some data types have special syntax support, in particular for defining literal values.
### String
  2 way to create string object:
  - single quotation '' : amount of processing Ruby does very little.
  - double quotation """" : Ruby does more work, it looks for substitutions - sequence that start with a backslash character and is replaced with a binary value. ex: \n
### Array
  - create & initialize a new array object using an array literal.
    ```
    a = [ 1, 'cat', 3.14 ] #array with three el
    a[0]                   # access the first el (1)
    a[2] = nil             # set the third element
    # array now [ 1, 'cat', nil ]
    ```
  - nil is an object that represents nothing
  - the << method appends a single value to its receiver array
    ```
    ages=[]
    for person in @people
      ages << person.age
    end
    ```

### Hashes
  - like object in javascript 
    ```
    inst_section = {
      :cello => 'string'
      :clarinet => 'woodwind'
      :drum => 'percussion'
      :oboe => 'woodwind'
    }
    ```
    other way
    ```
    inst_section = {
      cello: 'string',
      clarinet: 'woodwind',
      drum: 'percussion',
      oboe: 'woodwind'
    }
    ```
    even we can use a symbol (like var in js), just dont forget to put space between colon
    ```
    inst_section = {
      cello: :string,
      clarinet: :woodwind,
      drum: :percussion
    }
    ```
  - hashes are indexed using the same square bracket notation as arrays
    ```
    inset_section[:clarinet] #=> :woodwind
    inset_section[:cello] #=> :string
    inset_section[:bassoon] #=> :nil
    ```

### Regex
  - too complicated, google it when you need it for now.
  
## Logic
### Control Structures
  - if statemengs and while loops like in js but no braces
  ```
  if count > 10
    puts "try again"
  elsif tries === 3
    puts "you lose"
  else
    puts "enter a number"
  end

  while weight < 100 and num_pallets <= 30
    pallet = next_pallet()
    weight += pallet.weight
    num_pallets += 1
  end
  ```
  - statement 'unless' is the opposite of if (checking for the condition to not be true)
  - statement 'until' is like 'unless' for 'while' (the loop continues until the condition evaluates to be true)
  - Statement modifiers are useful shortcut if the statement is a single expression. simply write the expression, followed by the modifier keyword and the condition
  ```
  puts "Danger, Will Robinson" if radiation > 3000
  distance = distance * 1.2 while distance < 100>
  ```
### Blocks and Iterators
  - code blocks are chunks of code between braces and do...end
  - convention: use braces for single-line blocks and do...end for multiline blocks
  ```
  { puts "Hello" } # this is a block
  
  do 
    club.enroll(person)
    person.socialize
  end
  # and so is this
  ```
  - code block can be invoked by yield statement, you can pass values the the block by giving params to yield. within the block, you list the names of the argument to receive these params between vertival bar (|) like in example below.
  - Code blocks often used in conjunction with iterators, like 'each'
  ```
  animals = %w{ ant bee cat dog elk }
  animals.each {|animal| puts animal }
  ```
  - times method
  ```
  3.times {print "Ho! " } #=> Ho! Ho! Ho!
  ```
  - the '&' prefix operator allows a method to capture a passed block as a named parameter
  ```
  def wrap &bloc
    print "Santa say: "
    3.times(&bloc)
    print"\n"
  end
  wrap { print "Ho! " }
  ```
### Exceptions
  - exceptions are objects of the Exception class or its subclasses.
  - 'raise' method causes an exception to be raised. it interrupts the normal flow through the code. and ruby searches back through the call stack for code that says it can handle this exception.
  - both methods and blocks of code wrapped between 'begin' and 'end' keywords intercept certain classes of exceptions using 'rescue' clauses
  ```
  begin
    content = load_blog_data(file_name)
  rescue BlogDataNotFound
    STDERR.puts "ile #{file_name} not found"
  rescue BlogDataFormatError
    STDERR.puts "Invalid blog data in #{file_name}"
  rescue Exception => exc
    STDERR.puts "General error loading #{file_name}: #{exc.message}"
  end
  ```

## Organizing Structure
  - Two basic concepts for organizing methods: classes and modules
### Classes
  - example of ruby's class definition
    ```
    class Order < ApplicationRecord
      has_many :line_items
      
      def self.find_all_unpaid
        self.where('paid = 0')
      end

      def total
        sum = 0
        line_items.each {|li| sum += li.total }
        sum
      end
    end
    ```
  - has_many is a method thats defined by Active Record.
  - self is like 'this' in js.
  - instance variables name all start with @. Instance variables are not directly accessible outside the class. to make them available, write methods that return their values
    ```
    class Greeter
      def initialize(name)
        @name = name
      end

      def name
        @name
      end

      def name=(new_name)
        @name = new_name
        end
      end

      g = Greeter.new("Barney")
      g.name #=> Barney
      g.name = "Betty"
      g.name # => Betty
    ```
  - shorthand way to write accessor by using attr methods
    ```
    class Greeter
      attr_accessor :name     # create reader and writer methods
      attr_reader :greeting   # create reader only
      attr_writer :age        # create writer only
    end
    ```
  - class instance methods are public by default, you can override using 'private' or 'protected' keyword. 'private' methods can be called only from within the same instance. 'protected' methods can be called both in the same instance and by other instances of the same class and its subclasses.
    ```
    class MyClass
      #default is public
      def m1 
      end

      #protected method
      protected
      def m2
      end

      @private method
      private
      def m3
      end
    end
    ```
### Modules
  - Modules are similar to classes in that they hold a collection of methods, constants, and other module and class definitions. Unlike with classes, you cant create objects based on modules.
  - 2 purposes of modules: 1. act as a namespace, so that methods names wont clash with those defined elsewhere. 2. to share functionality among classes.
  - Helper methods are an example of where Rails uses modules.
    ```
    module storeHelper
      def capitalize_words(string)
        string.split(' ').map{|word| word.capitalize}.join(' ')
      end
    end
    ```
  - YAML is also a module.

## Marshaling Objects
  - marshaling is a process of taking an object and convert it into stream of bytes that can be stored outside the application.
  - Rails use marshaling to store session data. 

------
Pulling it all together
```
class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.sting :image_url
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
```
