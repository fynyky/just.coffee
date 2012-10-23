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
        @element "li", "Less cognitive dissonance switching between HTML and script"
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
      
      
    
  
