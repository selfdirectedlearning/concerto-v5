concerto.server.respond = function(response, data=list()){
  concerto.log(" - - - - - - - - - - - - - - - - - ▶▶▶ .server.respond")
  concerto.log("responding to server...", ".respond ▶")

  port = concerto$initialPort
  if(!is.null(concerto$session)) {
      port = concerto$session$submitterPort
  }
  if(concerto$runnerType == RUNNER_SERIALIZED && file.exists("submitter.port")) {
    while(T) {
        fh = file("submitter.port", open="rt")
        port = readLines(fh)
        if(!is.null(concerto$session)) { concerto$session$submitterPort <<- port }
        close(fh)
        if(length(port) == 0) {
           Sys.sleep(0.1)
           next
        }
        unlink("submitter.port")
        break
    }
  }
  con = socketConnection(host="localhost", port=port)
  concerto.log(unlist(con), ".server.respond ▶ socketConnection")
  response = list("source"=SOURCE_PROCESS, "code"=response, "data"=data)
  concerto.log(unlist(response), ".server.respond ▶ response to be sent to server")
  writeLines(paste(toJSON(response),"\n",sep=''),con)
  concerto.log(unlist(con), ".server.respond ▶ response+con")
  close(con)
  concerto.log("responded to server", ".server.respond ▶")
  concerto.log(" - - - - - - - - - - - - - - - - - ◀◀◀ .server.respond")
}
