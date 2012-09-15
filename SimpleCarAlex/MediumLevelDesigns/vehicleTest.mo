model vehicleTest
  import Modelica.SIunits.*;
  import vehicle.*;
  Driver driver(mass = 60) "burn 1 kg/s";
  carInterface car(carMass = 1500, friction = 0.5);
  Tank tank(tareMass = 100, maxCapacity = 50);
  Engine engine(r = 10000);
equation
  connect(driver.throttle,tank.fuelRateCmd);
  connect(tank.fuelRateOut,engine.fuelBurnRate) "throttle=engine.fuelBurnRate";
  car.drivingForce = if tank.currentFuel >= 0 then engine.force else 0;
  engine.force = engine.r * engine.fuelBurnRate;
  car.totalMass = car.carMass + driver.mass + tank.mass;
end vehicleTest;

