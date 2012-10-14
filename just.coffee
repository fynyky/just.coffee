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
      when "a","abbr","acronym","address","applet","area", "article","aside","audio"
          ,"b","bdi","base","basefont","bdo","big","blockquote","body","br","button"
          ,"canvas","caption","center","cite","code","col","colgroup","command"
          ,"data","datagrid","datalist","dd","del","details","dfn","dir","div","dl","dt"
          ,"em","embed","eventsource"
          ,"fieldset","figcaption","figure","font","footer","form","frame","frameset"
          ,"h1","h2","h3","h4","h5","h6","head","header","hgroup","hr","html"
          ,"i","iframe","img","input","ins","isindex"
          ,"kbd","keygen"
          ,"label","legend","li","link"
          ,"mark","map","menu","meta","meter"
          ,"nav"
          ,"noframes","noscript"
          ,"object","ol","optgroup","option","output"
          ,"p","param","pre","progress"
          ,"q"
          ,"ruby","rp","rt"
          ,"s","samp","script","section","select","small","source","span","strike","strong","style","sub","summary","sup"
          ,"table","tbody","td","textarea","tfoot","th","thead","time","title","tr","track","tt"
          ,"u","ul"
          ,"var","video"
          ,"wbr" then name
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

# syntactic sugar for making text nodes more "declarative"
Node.prototype.text = (value)->
  @appendChild document.createTextNode value


# syntactic sugar for making attributs more "declarative"
Node.prototype.attribute = (name, value)->
  @setAttribute name, value

