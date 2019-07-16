concerto.test.getNodes = function(testId){
  concerto.log("▶▶▶ .getNodes")
  idField <- "flowTest_id"
  testId <- dbEscapeStrings(concerto$connection,toString(testId))
  result <- dbSendQuery(concerto$connection,sprintf("SELECT id, type, sourceTest_id FROM TestNode WHERE %s='%s'",idField,testId))
  response <- fetch(result,n=-1)

  concerto.log("◀◀◀ .getNodes")
  return(response)
}
