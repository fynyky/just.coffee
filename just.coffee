# ----------------pollution----------------
# window.node
# Element.prototype.node
# Element.prototype.oncreate
# Element.prototype.attribute
# ------------------------------------------
 
# main function for making nodes
window.node = (nameOrNode, oncreate)->
  
  # if function is passed an already built element
  # then no need to build it
  if nameOrNode instanceof Node then newNode = nameOrNode
  
  # create the element of the appropriate type
  # if the name is already a valid html tag then create one of that type
  # otherwise default to a div and just set the classname
  else
    name = nameOrNode
    tag = switch name
      when "a","abbr","acronym","address","applet","area"
          ,"b","base","basefont","bdo","big","blockquote","body","br","button"
          ,"caption","center","cite","code","col","colgroup"
          ,"dd","del","dfn","dir","div","dl","dt"
          ,"em"
          ,"fieldset","font","form","frame","frameset"
          ,"h1","h2","h3","h4","h5","h6","head","hr","html"
          ,"i","iframe","img","input","ins","isindex"
          ,"kbd"
          ,"label","legend","li","link"
          ,"map","menu","meta"
          ,"noframes","noscript"
          ,"object","ol","optgroup","option"
          ,"p","param","pre"
          ,"q"
          ,"s","samp","script","select","small","span","strike","strong","style","sub","sup"
          ,"table","tbody","td","textarea","tfoot","th","thead","title","tr","tt"
          ,"u","ul"
          ,"var" then name
      else "div"
    newNode = document.createElement tag
    newNode.className = name
  
  # regardless of where it came from
  # bind and perform the oncreate function
  newNode.oncreate = oncreate
  if newNode.oncreate? then do newNode.oncreate
  
  # return it
  return newNode


# build the node then stick it to parent
Node.prototype.node = (name, oncreate)->
  newNode = window.node name,oncreate
  @appendChild newNode
  return newNode


# syntactic sugar for making attributs more "declarative"
Node.prototype.attribute = (name, value)->
  @setAttribute name, value
