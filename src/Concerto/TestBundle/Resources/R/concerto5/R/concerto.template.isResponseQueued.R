concerto.template.isResponseQueued = function(){
    concerto.log("▶▶▶ .template.isResponseQueued")
    concerto.log("◀◀◀ .template.isResponseQueued")
    return(concerto$runnerType == RUNNER_SERIALIZED && !is.null(concerto$queuedResponse))
}
