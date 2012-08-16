model vehicleController
  vector enemyPos();
  // Input target position and Velocity
  vector enemyV();
  vector selfPos();
  // Input Self Pos and Velocity
  vector selfV();
  parameter Real maxThrust;
  // From thruster
  Real cmdDir;
  // Ouput Direction to thruster
  Real cmdThrust;
  // Magnitude Thrust to thruster
equation
  dir = enemyPos.theta;
  cmdThrust = maxThrust;
end vehicleController;

