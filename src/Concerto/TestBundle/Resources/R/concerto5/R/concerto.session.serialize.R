concerto.session.serialize <- function(){
    concerto.log(concerto$sessionFile, "serializing session...", ".serialize")

    serialized = serialize(concerto, NULL)
    writeBin(serialized, concerto$sessionFile)

    concerto.log("session serialized", ".serialize")
}
