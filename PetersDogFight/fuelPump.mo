model fuelPump
  import Modelica.Blocks.Continuous.*;
  parameter Real mass;
  // mass of fuel pump
  parameter Real maxDp;
  // max delta Pressure
  parameter Real A;
  // Pipe Cross-Sectional Area
  parameter Real T;
  // Cmd-To-Actuall time constant
  parameter Real C = 1;
  // Orifice Constant
  parameter Real rho = 1000;
  // Fuel Density
  Real actDp;
  // actuall deltaP
  Real cmdDp;
  // target deltaP
  Real currDp;
  // How much pressure is currently in the fuel pump
  Real fuelPumpRate;
  // How much fuel is flowing through the pump
  TransferFunction pump(b = {1}, a = {T,1});
  // cmd-actuall transfer function
equation
  connect(pump.u,cmdDp);
  connect(pump.y,actDp);
  currDp = if actDp < maxDp then actDp else maxDp;
  fuelPumpRate = C * A * sqrt(2 * rho * currDp);
end fuelPump;

