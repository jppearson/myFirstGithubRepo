model vehicleTest2 "throttle>fuelRateCmd>drivingForce"
  import vehicle2.*;
  Real c = 1 "efficiency of fuel, (engine)";
  Driver driver(mass = 60, throttle = 1) "throttle how hard driver pushes on throttle";
  Road road(mu = 0.85);
  carInterface car(carMass = 1000);
  Tank tank(tareMass = 50, maxCapacity = 45);
equation
  connect(road.mu,car.friction);
  connect(driver.throttle,tank.fuelRateCmd);
  tank.fuelRateOut = c * drivingForce;
  car.totalMass = car.carMass + driver.mass + tank.mass;
end vehicleTest2;

