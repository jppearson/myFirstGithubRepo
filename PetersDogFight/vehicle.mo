model vehicle
  import Modelica.Math.*;
  Real totalMass;
  // Total Mass of vehicle
  Real[2] F;
  // Force acting on the vehicle
  Real[2] pos;
  // Starting Position of the Vechicle
  Real[2] v;
  // Starting Velocity of the Vechicle
  Real[2] a;
  // Starting Acceleration of the Vechicle
  parameter Real[2] enemyPos = {0,0};
  //Real[2] enemyV;
  fuelTank FT(tareMass = 25, maxCapacity = 10000);
  fuelPump FP(mass = 5, maxDp = 23, A = 0.15, T = 3);
  thruster vThruster(mass = 50, rMax = 7.6, n = 6, K = 23000, LagK = 1);
  vehicleController controller();
equation
  totalMass = FT.mass + FP.mass + vThruster.mass;
  der(pos[1]) = v[1];
  der(pos[2]) = v[2];
  der(v[1]) = a[1];
  der(v[2]) = a[2];
  F[1] = totalMass * a[1];
  F[2] = totalMass * a[2];
  connect(enemyPos,controller.enemyPos);
  connect(pos,controller.selfPos);
  connect(F,vThruster.outT);
  connect(controller.cmdDir,vThruster.cmdDir);
  connect(controller.cmdThrust,vThruster.cmdT);
  connect(vThruster.fuelBurnRate,FP.fuelRateOut);
  connect(vThruster.fuelRateControl,FP.cmdPumpRate);
  connect(FP.fuelRateIn,FT.fuelRateOut);
  connect(FP.fuelTankLoss,FT.fuelRateCmd);
end vehicle;

