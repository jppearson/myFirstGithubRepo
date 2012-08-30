model vehicleTest
  import vehicle.*;
  Driver driver(Throttle = 1);
  Road road(mu = 0.85);
  carInterface car;
equation
  connect(driver.Throttle,car.drivingForce);
  connect(road.mu,car.friction);
end vehicleTest;

