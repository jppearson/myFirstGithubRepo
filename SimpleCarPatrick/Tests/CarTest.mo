model CarTest

  replaceable Car.SimpleCar car;
  replaceable Driver.SimpleDriver driver;
  //replaceable Atmosphere.SimpleAtmosphere atmosphere;
  replaceable Road.SimpleRoad road;

equation
  //connect( atmosphere.ambient, car.intake );
  //connect( car.exhaust, atmosphere.exhaust );
  connect( driver.throttle, car.throttle );
  connect( car.position, driver.vehiclePosition );
  connect( road.surface, car.wheel );

end CarTest;