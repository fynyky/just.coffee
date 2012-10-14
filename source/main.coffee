#@codekit-prepend "just.coffee";
document.body.node "background"
document.body.node "article", ->
  @node "header"
  @node "section"
