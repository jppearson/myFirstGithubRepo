model vehicleController
  vector enemyPos();
  // Input target position and Velocity
  vector enemyV();
  vector selfPos();
  // Input Self Pos and Velocity
  vector selfV();
  Real dir;
  // Ouput Direction to thruster
  Real thrust;
  // Ouput Thrust to thruster
  Real cmdDeltaP;
  // Target DeltaP in Fuel Pump
  Real actDeltaP;
  // Current Pressure in Fuel Pump
equation
  dir = enemyPos.theta;
end vehicleController;

