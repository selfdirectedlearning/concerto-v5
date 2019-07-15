require(concerto5)
require(parallel)

concerto5:::concerto.init(
    connectionParams = fromJSON(commandArgs(TRUE)[4]),
    publicDir = commandArgs(TRUE)[2],
    mediaUrl = commandArgs(TRUE)[3],
    maxExecTime = as.numeric(commandArgs(TRUE)[5]),
    maxIdleTime = as.numeric(commandArgs(TRUE)[6]),
    keepAliveToleranceTime = as.numeric(commandArgs(TRUE)[7]),
    runnerType = as.numeric(commandArgs(TRUE)[8])
)

switch(concerto$connectionParams$driver,
    pdo_mysql = require("RMySQL"),
    pdo_sqlsrv = require("RSQLServer")
)

#fifo_path = commandArgs(TRUE)[1]

concerto.log("starting listener", "forker.R ▶")
queue = c()
unlink(paste0(commandArgs(TRUE)[1],"*.fifo"))
while (T) {
    fpath = ""
    if(length(queue) == 0) {
        queue = list.files(commandArgs(TRUE)[1], full.names=TRUE)
    }
    if(length(queue) > 0) {
        fpath = queue[1]
        queue = queue[-1]
    } else {
        Sys.sleep(0.25)
        next
    }
    concerto.log(fpath, "forker.R ▶ while(T) : fpath")
    con = fifo(fpath, blocking=TRUE, open="rt")
    concerto.log("incoming session request", "forker.R ▶ while(T)")
    response = readLines(con, warn = FALSE, n = 1, ok = FALSE)
    concerto.log(unlist(response), "forker.R ▶  while(T)>readLines : response")
    response = tryCatch({
        fromJSON(response)
    }, error = function(e) {
        message(e)
        message(response)
        q("no", 1)
    })
    concerto.log(unlist(response), "forker.R ▶  while(T)>tryCatch : response")
    close(con)
    unlink(fpath)
    message(response$sessionId)
    mcparallel({
        sink(file = response$rLogPath, append = TRUE, type = "output", split = FALSE)
        concerto.log("starting session", "forker.R ▶")
        rm(queue)
        rm(fpath)
        rm(con)

        concerto$lastSubmitTime <- as.numeric(Sys.time())
        concerto$lastKeepAliveTime <- as.numeric(Sys.time())
        concerto.log(unlist(response), "forker.R ▶ response to be passed to .run")
        concerto5:::concerto.run(
            workingDir = response$workingDir,
            client = response$client,
            sessionHash = response$sessionId,
            maxIdleTime = response$maxIdleTime,
            maxExecTime = response$maxExecTime,
            response = response$response,
            initialPort = response$initialPort
        )
    }, detached = TRUE)
}
concerto.log("listener closing", "forker.R ▶")
