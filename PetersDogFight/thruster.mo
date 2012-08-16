model thruster
  // The Thruster takes an input direction, and cmd Thrust to output from controller
  // and outputs a vector Thrust output to the vehicle
  import Modelica.Blocks.Continuous.*;
  import Modelica.Math.*;
  parameter Real mass;
  parameter Real rMax;
  // Max Fuel Burn Rate
  parameter Real n;
  // Fuel Burn Efficiency
  parameter Real K;
  // Asymptotic Max Thrust
  parameter Real LagK;
  // Direction lag-time constant
  Real cmdDir;
  // input direction from controller
  Real actDir;
  Real fuelBurnRate;
  // current Fuel Burn Rate the thruster needs to burn
  Real cmdT;
  // target  thrust output from controller
  Vector outT();
  // Output thrust to vehicle
  TransferFunction g(b = {1}, a = {LagK,1});
  // Cmd-To-Actuall Transfer Function 
equation
  connect(g.u,cmdDir);
  connect(g.y,actDir);
  outT.magnitude = K * (1 - e ^ (-fuelBurnRate / n));
  outT.x = cmdT * cos(actDir);
  outT.y = cmdT * sin(actDir);
end thruster;

