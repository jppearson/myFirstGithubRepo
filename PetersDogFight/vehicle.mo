model vehicle
  parameter Real totalMass;
  // Total Mass of vehicle
  Vector F(x = 0, y = 0);
  // Force acting on the vehicle
  Vector pos(x = 0, y = 0);
  // Starting Position of the Vechicle
  Vector v(x = 0, y = 0);
  // Starting Velocity of the Vechicle
  Vector a(x = 0, y = 0);
  // Starting Acceleration of the Vechicle
  Vector enemyPos();
  Vector enemyV();
  fuelTank FT();
  fuelPump FP();
  thruster vThruster();
  vehicleController controller();
equation
  dir(pos.x) = v.x;
  dir(pos.y) = v.y;
  dir(v.x) = a.x;
  dir(v.y) = a.y;
  F.x = totalMass * a.x;
  F.y = totalMass * a.y;
  controller.enemyPos = enemyPos;
  controller.enemyV = enemyV;
  controller.selfPos = pos;
  controller.selfV = v;
  F = vThruster.outT;
  connect(controller.cmdDir,vThruster.cmdDir);
  connect(controller.cmdThrust,vThruster.cmdT);
  connect(controller.maxThrust,vThruster.K);
  connect(vThruster.fuelRateControl, FT.fuelRateCmd);
  connect(FT.fuelRateOut,FP.fuelPumpRate);
  connect(FP.fuelPumpRate, 
end vehicle;

