concerto.session.serialize <- function(){
    concerto.log(" - - - - - - - - - - - - - - - - - ▶▶▶ .session.serialize")
    concerto.log(concerto$sessionFile, ".serialize ▶ serializing session...")

    serialized = serialize(concerto, NULL)
    writeBin(serialized, concerto$sessionFile)

    concerto.log("session serialized", ".serialize ▶")
    concerto.log(" - - - - - - - - - - - - - - - - - ◀◀◀ .session.serialize")
}
