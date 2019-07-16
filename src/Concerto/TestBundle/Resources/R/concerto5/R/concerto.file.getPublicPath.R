concerto.file.getPublicPath = function(filename){
    concerto.log("▶▶▶ .file.getPublicPath")
    return(paste0(concerto$publicDir, filename))
    concerto.log("◀◀◀ .file.getPublicPath")
}
