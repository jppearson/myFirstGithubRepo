package CarTest
  import Vehicles.MidLevelCar;
  import Modelica.Mechanics.Translational.Interfaces.Flange_a;
  model MidLevelCarTest
    Real airOut;
    Real light;
    Modelica.Mechanics.Translational.Interfaces.Flange_a sampleSurface();
    Drivers.MidLevelDriver driver();
    Vehicles.MidLevelCar car(airIn = 5, timeOfDay = 1);
    annotation(experiment(StartTime = 0.0, StopTime = 100, Tolerance = 1e-006));
  equation
    connect(driver.cmdThrottle,car.gasPedal);
    connect(driver.cmdBrake,car.brakePedal);
    connect(driver.cmdDir,car.steeringWheel);
    connect(driver.driverMass,car.driverMass);
    connect(car.roadSurface,sampleSurface);
    connect(airOut,car.airOut);
    connect(car.headlights,light);
  end MidLevelCarTest;
end CarTest;

