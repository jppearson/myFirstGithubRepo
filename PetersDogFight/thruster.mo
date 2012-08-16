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
  TransferFunction g(b = {1}, a = {LagK,1});
  // Cmd-To-Actuall Transfer Function 
  Real cmdT;
  // target  thrust output from controller
  Real fuelBurnRate;
  // current Fuel Burn Rate the thruster needs to burn
  Real fuelRateControl;
  // Send to fuel pump
  Real[2] outT;
  // Output thrust to vehicle
  Real outTMag;
equation
  connect(g.u,cmdDir);
  connect(g.y,actDir);
  fuelRateControl = if -n * log(1 - cmdT / K) < rMax then -n * log(1 - cmdT / K) else rMax;
  outTMag = K * (1 - exp(-fuelBurnRate / n));
  outT[1] = outTMag * cos(actDir);
  outT[2] = outTMag * sin(actDir);
end thruster;

