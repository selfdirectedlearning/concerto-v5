concerto.test.getConnections = function(testId){
  concerto.log(" - - - - - - - - - - - - - - - ▶▶▶ .getConnections")

  idField <- "flowTest_id"
  testId <- dbEscapeStrings(concerto$connection,toString(testId))
  result <- dbSendQuery(concerto$connection,sprintf("
    SELECT id, sourceNode_id, sourcePort_id, destinationNode_id, destinationPort_id, returnFunction
    FROM TestNodeConnection
    WHERE %s='%s'",idField,testId))
  response <- fetch(result,n=-1)

  concerto.log(" - - - - - - - - - - - - - - - ◀◀◀ .getConnections")
  return(response)
}
