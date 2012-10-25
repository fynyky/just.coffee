#@codekit-prepend "just.coffee";
document.body.element "background"
document.body.element "article", ->
    
  @element "header", ->
    @element "h1", "just.coffee"
    @element "p", "Build the DOM using Coffeescript"
  
  @element "section", ->
    @element "what", ->
      @element "h1", "What"
      @element "p", "Simple helper functions that let you build the DOM like this"
      @element "pre", """
                       @element "why", ->
                         @element "h1", "Why"
                         @element "ul", ->
                           @element "li", "Less cognitive dissonance switching between HTML and script"
                           @element "li", "There is one hierarchy: The code hierarchy"
                           @element "li", "Full code flexibility in creating templates"
                           @element "li", "No magic, just functions, it's just coffeescript"
                         
                       
                       """
    
    @element "why", ->
      @element "h1", "Why"
      @element "ul", ->
        @element "li", "Less context switching between HTML and script"
        @element "li", "There is one hierarchy: The code hierarchy"
        @element "li", "Full code flexibility in creating templates"
        @element "li", "No magic, just functions, it's just coffeescript"
      
    
    @element "how"  , ->
      @element "h1", "How"
      @element "ol", ->
        @element "li", ->
          @text "download it from github "
          @element "a", "here"
        @element "li", "add the script tag to your header"
        @element "li", "start using it!"
      
      
    
  
  @element "section", ->
    @element "h1", "A rose by any other name"
    @element "p", "To create an element, just provide the class name(s) you want it to have."
    @element "pre", """
                    # Class names which are valid HTML tags will parse accordingly
                    element "h1"   # <h1 class="h1"></h1>
                    element "p"    # <p class="p"></p>
                    element "span" # <span class="span"></span>
                    
                    # Unknown tags will create divs with that class name
                    element "foo" # <div class="foo"></div>
                    
                    # Multiple class names can be given in the string
                    # If there are valid HTML tags among the class names, the first is used.
                    element "cheese ball cake" # <div class="cheese ball cake"></div>
                    element "span h1 lobster"  # <span class="span h1 lobster"></span>
                    """
    @element "p", "You can also pass an already created DOM element instead of a string. This does nothing on its own, but is useful when calling it with an oncreate function or attaching it to a parent element"
  
  @element "section", ->
    @element "h1", "Batteries included"
    @element "p", "Each element can be given a function to be called on its creation. This is done in the context of the created element."

  @element "section", ->
    @element "h1", "I heard you like elements"
    @element "p", "Each Element also has a element function that creates an element and adds it as a child node to the Element."
    
    @element "pre", """
                    foo = element "foo"
                    # Just creates an free standing <div class="foo"></div>

                    foo.element "bar"
                    # foo now has a bar nested inside it
                    # <div class="foo">
                    #   <div class="bar"></div>  
                    # </div>
                    """
    @element "p", "Use this inside an elements oncreate function with the @ symbol. This allows declarative creation of DOM hierarchies."
    @element "pre", """
                    foobarbazqux = element "foo", ->
                      @element "bar", ->
                        @element "baz", ->
                          @element "qux"
                    
                    # <div class="foo">
                    #   <div class="bar">
                    #     <div class="baz">
                    #       <div class="qux"></div>
                    #     </div>
                    #   </div>
                    # </div>
                    """
  
  @element "section", ->
    @element "h1", "Snack packs"
    @element "p", "To make something modular just wrap it in a function"
    @element "pre", """
                    FoobarSnack = (snackName)->
                      element "foo", ->
                        element "bar", snackName
                    
                    cheeseNames = ["cheddar", "swiss", "blue"]
                    cheesePlate = element "cheesePlate", ->
                      for cheeseName in cheeseNames
                        @element FoobarSnack cheeseName
                    
                    # <div class="cheesePlate">
                    #   <div class="foo">
                    #     <div class="bar">cheddar</div>
                    #   </div>
                    #   <div class="foo">
                    #     <div class="bar">swiss</div>
                    #   </div>
                    #   <div class="foo">
                    #     <div class="bar">blue</div>
                    #   </div>
                    # </div>
                    """
  
