#@codekit-prepend "just.coffee";
document.body.node "background"
document.body.node "article", ->
  @node "header", ->
    @node "h1", -> @text "just.coffee"
    @node "p", -> @text "Create the DOM using Coffeescript"
  
  @node "section", ->
    @node "code", -> 
      @text """
            document.body.node "article", ->
              @node "header", ->
                @node "h1", -> @text "just.coffee"
                @node "p", -> @text "Create the DOM using Coffeescript"
            
            """
  
