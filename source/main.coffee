#@codekit-prepend "just.coffee";

document.body.e "background"

CoffeeCodeBlock = (string)->
  @e "pre", @e "code prettyprint lang-coffee", string


document.body.e "article", ->
  @e "header", ->
    @e "h1 title", "just.coffee"
    @e "span subtitle", ->
      @t "Build the DOM using "
      @e "a", ->
        @t "Coffeescript"
        @attribute "href", "http://coffeescript.org/"
      
    
    @e "a gitHubLink", ->
      @t "GitHub project"
      @attribute "href", "https://github.com/fynyky/just.coffee"
  
  @e "section split", ->
    @e "section", ->
      @e "h2", "What"
      @e "p", ->
        @t "A function "
        @e "code", "e"
        @t " that returns a DOM element and lets you compose structures using a function hierarchy like this:"
      
      @e CoffeeCodeBlock """
        document.body.e "article", ->
          
          @e "header", ->
            @e "h1 title", "just.coffee"
            @e "span subtitle", "...."
          
          @e "section split", ->
            @e "section", ->
              @e "h2", "What"
              @e "p", ->
                @t "A function "
                @e "code", "e"
                @t "Whoa too meta"
          
          @e "anExampleElement", ->
            
            aVariable = "beep"
            @onclick = -> alert aVariable
            
            Food = (foodName) ->
              e "food", foodName
            
            for item in ["ice", "cream"]
              @e Food item
            
      """ 
    
    @e "section", ->
      @e "h2", "Why"
      @e "ul", ->
        @e "li", "No context switching from HTML to script"
        @e "li", "There is one hierarchy: The code hierarchy"
        @e "li", 'Templates with full code flexibility'
        @e "li", ->
          @e "a", ->
            @t "Coffeescript"
            @attribute "href", "http://coffeescript.org/"
          
          @t " is pretty"
        @e "li", "No framework magic, it's just functions"
      
    
    @e "section"  , ->
      @e "h2", "How"
      @e "p", "Option 1: just.coffee.js"
      @e "ol", ->
        @e "li", ->
          @e "a", ->
            @t "Download it from GitHub"
            @attribute "href", "https://github.com/fynyky/just.coffee/zipball/master"
          
        
        @e "li", "Add the script tag to your header"
        @e "li", "Profit!"
      
      @e "p", "Option 2: just.coffee"
      @e "ol", ->
        @e "li", ->
          @e "a", ->
            @t "Download it from GitHub"
            @attribute "href", "https://github.com/fynyky/just.coffee/zipball/master"
          
        
        @e "li", "??? (do your coffeescript thing)"
        @e "li", "Profit!"
      
    
  
  @e "section", ->
    @e "h2", "A rose by any other name"
    @e "p", ->
      @t "The core of just.coffee is a function "; @e "code", "e"; @t " that creates DOM elements. Just provide the class name(s) you want it to have."
    
    @e CoffeeCodeBlock """
                    # Class names which are valid HTML tags will parse accordingly
                    e "h2"   # <h2 class="h2"></h2>
                    e "p"    # <p class="p"></p>
                    e "span" # <span class="span"></span>
                    
                    # Unknown tags will create divs with that class name
                    e "foo" # <div class="foo"></div>
                    
                    # Multiple class names can be given in the string
                    # If there are multiple valid HTML tags among the class names, the first valid HTML tag is used.
                    e "cheese ball cake" # <div class="cheese ball cake"></div>
                    e "span h2 lobster"  # <span class="span h2 lobster"></span>
                    e "foo p bar section"  # <p class="foo p bar section"></span>
                    """
  
  @e "section", ->
    @e "h2", "Batteries included"
    @e "p", -> @t "The second argument to "; @e "code", "e"; @t " is an "; @e "code", "oncreate" ;@t " function that is called in the context of the created element."
    @e CoffeeCodeBlock """
    
      # The "@" symbol is coffeescript shorthand for "this."
      
      # Creating <div class="aFunkyDiv">FUNKY!</div>
      # using a predefined function for oncreate      
      aFunkyFunction = -> @innerHTML = "FUNKY!"
      e "aFunkyDiv", aFunkyFunction
      
      # Doing the same thing using an anonymous function
      e "aFunkyDiv", -> this.innerHTML = "FUNKY!"
      
      # buttons!
      e "aButton", ->
        @innerHTML = "Shut up!"
        @onclick = ->
          alert "Help! Help! I'm being pressed!"
        
      # programatic content!
      e "aSongMyDearLady", ->
        totalBottles = 99
        songLyrics = ""
        while totalBottles >= 0
          lyricAddition = totalBottles + " bottles of beer on the wall! " + totalBottles + " bottles of beer!"
          songLyrics += lyricAddition
          totalBottles -= 1
        @innerHTML = songLyrics  
    """
  
  @e "section", ->
    @e "h2", "I heard you like elements"
    @e "p", -> 
      @t "The "; @e "code", "e"; @t " function can also be called in the context of an existing element. This automatically appends the newly created element as a child to the existing element."
    
    @e CoffeeCodeBlock """
      foo = e "foo"
      # Just creates an free standing <div class="foo"></div>

      foo.e "bar"
      # foo now has a bar nested inside it
      # <div class="foo">
      #   <div class="bar"></div>  
      # </div>
    """
    @e "p", -> @t " Use this inside an elements "; @e "code", "oncreate"; @t " function with the "; @e "code", "@"; @t " symbol. This allows declarative creation of DOM hierarchies."
    @e CoffeeCodeBlock """
      # The "@" symbol is coffeescript shorthand for "this."
      
      foobarbazqux = e "foo", ->
        @e "bar", ->
          @e "baz", ->
            @e "img qux", ->
              @src = "aDuck.png"

      # <div class="foo">
      #   <div class="bar">
      #     <div class="baz">
      #       <img class="img qux" src="aDuck.png">
      #     </div>
      #   </div>
      # </div>
    """
    
    @e "p", -> @t "To add text nodes, use the handy dandy "; @e "code", "t"; @t " function."
    @e CoffeeCodeBlock """
                    aStackOfCake = e "cake", ->
                      @t "yes this is cake and "
                      @e "someIcing", ->
                        @t "some Icing"

                    # <div class="cake">
                    #   "yes this is cake and"
                    #   <div class="bar">"some Icing"</div>
                    # </div>
                    """
  
  @e "section", ->
    @e "h2", "We care not where thou art from"
    @e "p", -> @t "You can also use "; @e "code", "e"; @t " to add existing elements."
    @e CoffeeCodeBlock """
      aPreMadeElement = e "aPreMadeElement"
      aTraditionallyMadeElement = document.createElement "div"
      aTraditionallyMadeElement.className = "aTraditionallyMadeElement"
      
      aBoxOfSox = e "aBoxOfSox", ->
        @e aPreMadeElement
        @e aTraditionallyMadeElement
        @e "aFreshlyMadeElement"
      
      # <div class="aBoxOfSox">
      #   <div class="aPreMadeElement"></div>
      #   <div class="aTraditionallyMadeElement"></div>
      #   <div class="aFreshlyMadeElement"></div>
      # </div>
    """
    @e "p", -> @t "You can also use it to wrap existing elements with a function."
    @e CoffeeCodeBlock """
      aBoringDiv = document.createElement "div"
      anExcitingButtonDiv = e aBoringDiv, ->
        @className = "anExcitingButtonDiv"
        @onclick = -> alert "I used to be a boring div like you, but then I took a function to the e"
      
    """
    
  
  @e "section", ->
    @e "h2", "Mr Clean"
    @e "p", -> @t "To reduce syntactic cruft, you can directly pass a string or element inplace of an "; @e "code", "oncreate"; @t " function"
    @e CoffeeCodeBlock """
      # This
      e "code", "foobar"
      
      # is equivalent to this
      e "code", ->
        @t "foobar"
      
      # which both return
      # <code class="code">foobar</code>
        
      # Similarly, this
      e "pre", e "code", "foobar"
      
      # is equivalent to this
      e "pre", ->
        @e "code", ->
          @t "foobar"
        
      # which both return
      # <pre class="pre"><code class="code">foobar</code></pre>
      
      
    """
  
  @e "section", ->
    @e "h2", "Snack packs"
    @e "p", "To make something modular just wrap it in a function"
    @e CoffeeCodeBlock """
      FoobarSnack = (snackName)->
        e "foo", ->
          e "bar", snackName
      
      cheeseNames = ["cheddar", "swiss", "blue"]
      cheesePlate = e "cheesePlate", ->
        for cheeseName in cheeseNames
          @e FoobarSnack cheeseName
      
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
  

do prettyPrint