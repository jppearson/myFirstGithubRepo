model vehicleController
  import Modelica.Constants.pi;
  Real[2] enemyPos;
  // Input target position and Velocity
  // Real[2] enemyV;
  Real[2] selfPos;
  // Input Self Pos and Velocity
  //Real[2] selfV();
  parameter Real maxThrust3 = 1000;
  parameter Real maxThrust1 = 5000;
  parameter Real maxThrust2 = 10000;
  parameter Real maxThrust4 = 20000;
  parameter Real maxThrust5 = 23000;
  parameter Real[4] t = {40,80,120,140};
  Real cmdDir;
  // Ouput Direction to thruster
  Real cmdThrust;
  // Magnitude Thrust to thruster
equation
  cmdDir = if time < t[1] then pi / 4 else if time < t[2] then 0 else if time < t[3] then (3 * pi) / 4 else pi / 4;
  cmdThrust = if time < t[1] then maxThrust3 else if time < t[2] then maxThrust1 else if time < t[3] then maxThrust2 else maxThrust4;
end vehicleController;

