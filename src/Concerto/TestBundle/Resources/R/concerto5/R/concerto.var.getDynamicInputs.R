concerto.var.getDynamicInputs = c.getDynamicInputs = function(){
    concerto.log(" - - - - - - - - - - - - - - - ▶▶▶ .getDynamicInputs")
    result = list()
    flowIndex = length(concerto$flow)
    dynamicInputs = concerto$flow[[flowIndex]]$globals$.dynamicInputs
    if(length(dynamicInputs) > 0) {
        for(i in 1:length(dynamicInputs)) {
            name = dynamicInputs[i]
            result[[name]] = concerto$flow[[flowIndex]]$globals[[name]]
        }
    }
    concerto.log(" - - - - - - - - - - - - - - - ◀◀◀ .getDynamicInputs")
    return(result)
}
