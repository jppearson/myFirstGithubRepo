model vehicleTest2
  import Modelica.SIunits.*;
  import vehicle2.*;
  import Modelica.Math.*;
  Map map;
  Driver driver(mass = 60) "burn 1 kg/s";
  carInterface car(carMass = 1500, friction = 0.5);
  Tank tank(tareMass = 100, maxCapacity = 50);
  Engine engine(r = 10000);
equation
  connect(driver.throttle,tank.fuelRateCmd);
  connect(tank.fuelRateOut,engine.fuelBurnRate) "throttle=engine.fuelBurnRate";
  car.drivingForce[1] = if tank.currentFuel >= 0 then engine.force[1] else 0;
  car.drivingForce[2] = if tank.currentFuel >= 0 then engine.force[2] else 0;
  engine.force[1] = engine.r * engine.fuelBurnRate;
  engine.force[2] = engine.r * engine.fuelBurnRate;
  car.totalMass = car.carMass + driver.mass + tank.mass;
  connect(map.vehicleLocation[1],car.position[1]);
  connect(map.vehicleLocation[2],car.position[2]);
end vehicleTest2;

