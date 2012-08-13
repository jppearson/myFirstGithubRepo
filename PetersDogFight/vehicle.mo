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
  fuelTank FT();
  fuelPump FP();
  thruster vThruster();
  VehicleController controller();
equation
  totalMass = FT.mass + FP.mass + vThruster.mass;
  dir(pos.x) = v.x;
  dir(pos.y) = v.y;
  dir(v.x) = a.x;
  dir(v.y) = a.y;
  F.x = totalMass * a.x;
  F.y = totalMass * a.y;
  F.x = vThruster.T.x;
  F.y = vThruster.T.y;
  connect(controller.thrust,thruster.inputT);
  connect(controller.dir,thruster.inputDir);
  connect(FT.fuelRateCmd,vThruster.r);
end vehicle;

