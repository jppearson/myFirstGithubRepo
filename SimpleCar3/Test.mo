package Test
  import Drivers.MidLevelDriver;
  import Vehicles.MidLevelCar;
  import Atmosphere.SimpleAtmosphere;
  import Drivers.DummyDriver1;
  import Drivers.DummyDriver2;
  import Road.MidLevelRoad;
  import Modelica.Constants.*;
  model HighLevelTest
    DummyDriver2 driver();
    DummyCar car();
    SimpleAtmosphere atmosphere();
    Road road();
    annotation(experiment(StartTime = 0.0, StopTime = 700, Tolerance = 1e-006));
  equation
    connect(driver.driverMass,car.driverMass);
    connect(driver.cmdDir,car.steeringWheel);
    connect(driver.cmdThrottle,car.gasPedal);
    connect(driver.cmdBrake,car.brakePedal);
    connect(atmosphere.T,car.airTemperature);
    connect(atmosphere.P,car.airPressure);
    connect(atmosphere.timeOfDay,car.timeOfDay);
    connect(road.frictionMu,car.frictionMu);
    connect(road.carPos,car.position);
  end HighLevelTest;
  model MidLevelTest
    Drivers.MidLevelDriver driver();
    Vehicles.MidLevelCar car();
    Atmosphere.SimpleAtmosphere atmosphere();
    Road.MidLevelRoad road();
  equation
    connect(driver.driverMass,car.driverMass);
    connect(driver.cmdDir,car.steeringWheel);
    connect(driver.cmdThrottle,car.gasPedal);
    connect(driver.cmdBrake,car.brakePedal);
    connect(atmosphere.T,car.airTemperature);
    connect(atmosphere.P,car.airPressure);
    connect(atmosphere.timeOfDay,car.timeOfDay);
    connect(road.frictionMu,car.frictionMu);
    connect(road.carPosition,car.position);
    connect(road.surface,car.roadSurface);
  end MidLevelTest;
end Test;

