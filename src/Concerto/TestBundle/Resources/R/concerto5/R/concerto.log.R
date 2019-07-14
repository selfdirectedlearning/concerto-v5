concerto.log = function(obj, title=""){
    print(paste0("▼ ",if(title!=""){paste0(title," ")},"【",Sys.time(),"】"))
    print(obj)
}
