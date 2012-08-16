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
  Real cmdPumpRate;
  Real fuelRateIn;
  Real fuelRateOut;
  Real fuelTankLoss;
  Real currDp;
  TransferFunction pumpDelay(b = {1}, a = {T,1});
equation
  connect(pumpDelay.u,fuelRateIn);
  connect(pumpDelay.y,fuelRateOut);
  cmdPumpRate = C * A * sqrt(2 * rho * currDp);
  fuelTankLoss = if currDp < maxDp then cmdPumpRate else C * A * sqrt(2 * rho * maxDp);
end fuelPump;

