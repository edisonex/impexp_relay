// Log the URLs we need
server.log("Turn Power On: " + http.agenturl() + "?pwd=1");
server.log("Turn Power Off: " + http.agenturl() + "?pwd=0");

function requestHandler(request, response) {
  try {
    // Check if the user sent pwd as a query parameter
    if ("pwd" in request.query) {
      // If they did, and pwd = 1 or 0, set our variable to 1
      if (request.query.pwd == "1" || request.query.pwd == "0") {
        // Convert the pwd query parameter to a Boolean
        local pwdState = (request.query.pwd == "0") ? false : true;

        // Send "set.pwd" message to device, and send pwdState as the data
        device.send("set.pwd", pwdState); 
      }
    }
    
    // Send a response back to the browser saying everything was OK.
    response.send(200, "OK");
  } catch (ex) {
    response.send(500, "Internal Server Error: " + ex);
  }
}

// Register the HTTP handler to begin watching for HTTP requests from your browser
http.onrequest(requestHandler);
