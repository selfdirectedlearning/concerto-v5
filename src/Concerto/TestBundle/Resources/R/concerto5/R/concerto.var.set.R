concerto.var.set = c.set = function(name, value, global=F, posOffset = 0){
    concerto.log(" - - - - - - - - - - - - - - - - - ▶▶▶ .var.set")
    if(global || length(concerto$flow) == 0) {
        concerto$globals[name] <<- list(value)
    } else {
        flowIndex = length(concerto$flow)
        concerto$flow[[flowIndex + posOffset]]$globals[name] <<- list(value)
    }
    concerto.log(" - - - - - - - - - - - - - - - - - ◀◀◀ .var.set")
    return(value)
}
