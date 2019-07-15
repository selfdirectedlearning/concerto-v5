require(concerto5)

concerto5:::concerto.init(
    connectionParams = fromJSON(commandArgs(TRUE)[1]),
    publicDir = commandArgs(TRUE)[5],
    mediaUrl = commandArgs(TRUE)[6],
    maxExecTime = as.numeric(commandArgs(TRUE)[7]),
    maxIdleTime = as.numeric(commandArgs(TRUE)[8]),
    keepAliveToleranceTime = as.numeric(commandArgs(TRUE)[9])
)
concerto.log(as.numeric(commandArgs(TRUE)[9], "standalone.R ▶ .init : keepAliveToleranceTime")

concerto5:::concerto.run(
    workingDir = commandArgs(TRUE)[4],
    client = fromJSON(commandArgs(TRUE)[2]),
    sessionHash = commandArgs(TRUE)[3],
    response = fromJSON(commandArgs(TRUE)[10]),
    initialPort = commandArgs(TRUE)[11]
)
concerto.log(commandArgs(TRUE)[4], "standalone.R ▶ response passed to .run : workingDir")
concerto.log(unlist(fromJSON(commandArgs(TRUE)[2])), "standalone.R ▶ response passed to .run : client")
concerto.log(commandArgs(TRUE)[3], "standalone.R ▶ response passed to .run : sessionHash")
concerto.log(unlist(fromJSON(commandArgs(TRUE)[10])), "standalone.R ▶ response passed to .run : response")
concerto.log(commandArgs(TRUE)[11], "standalone.R ▶ response passed to .run : initialPort")
