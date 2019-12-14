function setRelayState(state) {
  state ? hardware.pin2.configure(DIGITAL_OUT, 1)
 : hardware.pin2.configure(DIGITAL_OUT, 0);
}

//I'm using a 12v-relay so I don't need Power Gated Pin1 to power up the 5v-relay
//hardware.pin1.configure(DIGITAL_OUT, 1);

// Register a handler function for incoming "set.pwd" messages from the agent
agent.on("set.pwd", setRelayState);
