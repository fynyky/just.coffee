# ----------------pollution----------------
# window.node
# Element.prototype.node
# Element.prototype.oncreate
# Element.prototype.attribute
# ------------------------------------------

validHTMLTags = [
  "a","abbr","acronym","address","applet","area", "article","aside","audio"
  "b","bdi","base","basefont","bdo","big","blockquote","body","br","button"
  "canvas","caption","center","cite","code","col","colgroup","command"
  "data","datagrid","datalist","dd","del","details","dfn","dir","div","dl","dt"
  "em","embed","eventsource"
  "fieldset","figcaption","figure","font","footer","form","frame","frameset"
  "h1","h2","h3","h4","h5","h6","head","header","hgroup","hr","html"
  "i","iframe","img","input","ins","isindex"
  "kbd","keygen"
  "label","legend","li","link"
  "mark","map","menu","meta","meter"
  "nav"
  "noframes","noscript"
  "object","ol","optgroup","option","output"
  "p","param","pre","progress"
  "q"
  "ruby","rp","rt"
  "s","samp","script","section","select","small","source","span","strike","strong","style","sub","summary","sup"
  "table","tbody","td","textarea","tfoot","th","thead","time","title","tr","track","tt"
  "u","ul"
  "var","video"
  "wbr"
] 

# main function for making nodes
window.node = (namesOrNode, oncreate)->
  
  # if function is passed an already built element
  # then no need to build it
  if namesOrNode instanceof Node then newNode = namesOrNode
  
  # create the element of the appropriate type
  # if the name is already a valid html tag then create one of that type
  # otherwise default to a div and just set the classname
  else if typeof namesOrNode is "string"
  
    # split the string to the individual class names
    # check to see if any of them are valid HTML tags
    # default to div otherwise
    names = namesOrNode.split " "
    validTags = (name for name in names when validHTMLTags.indexOf name >= 0)
    tag = validTags[0] ? "div"
    newNode = document.createElement tag
    newNode.className = namesOrNode
  
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

