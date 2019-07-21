concerto.session.get = function(sessionHash){
  concerto.log(" - - - - - - - - - - - - - - - - - ▶▶▶ .session.get")
  sessionHash <- dbEscapeStrings(concerto$connection,toString(sessionHash))
  result <- dbSendQuery(concerto$connection,sprintf("SELECT
                                                    id,
                                                    test_id,
                                                    timeLimit,
                                                    status,
                                                    params,
                                                    error,
                                                    clientIp,
                                                    clientBrowser,
                                                    submitterPort,
                                                    hash
                                                    FROM TestSession WHERE hash='%s'",sessionHash))
  response <- fetch(result,n=-1)
  concerto.log(response,".session.get : response")
  concerto.log(" - - - - - - - - - - - - - - - - - ◀◀◀ .session.get")
  return(response)
}
