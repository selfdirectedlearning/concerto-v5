concerto.session.stop <- function(status = STATUS_STOPPED, response = NULL, data=list()){
    concerto.log("▶▶▶ .session.stop")
    concerto.log("stopping session...", ".stop ▶")
    concerto.log(paste0("status: ", status), ".stop ▶")

    if(!is.null(concerto$session)) {
        concerto$session$status <<- status
        concerto5:::concerto.session.update()
    }
    dbDisconnect(concerto$connection)

    if (!is.null(response)) {
        concerto5:::concerto.server.respond(response, data)
    }
    q("no", if(status == STATUS_ERROR) 1 else 0)
    concerto.log("◀◀◀ .session.stop")
}
