concerto.directive.trans = function(opts, params){
    concerto.log("▶▶▶ .directive.trans")
    insert = c.trans(opts)
    if(Sys.info()['sysname'] == "Windows") {
        if(Encoding(insert) == "UTF-8") { insert = enc2native(insert) }
    }
    concerto.log("◀◀◀  .directive.trans")
    return(insert)
}
