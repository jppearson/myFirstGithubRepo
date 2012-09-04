// Peter Verlangieri
// September 3, 2012

model MidLevelTest
  // A high level test that contains a simpleAtmosphere, a dummyDriver, a dummyCar, and a frictionless road
  // that is used to test the overal simulation design, and topLevel connectivity.
  import HighLevelDesign.*;
  import Vehicles.MidLevelCar;
  import Atmospheres.SimpleAtmosphere;
  import Drivers.DummyDriver1;
  import Drivers.DummyDriver2;
  import Modelica.Constants.*;
  DummyDriver1 driver();
  MidLevelCar car();
  SimpleAtmosphere atmosphere();
  Road road(frictionMu = 0);
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
end MidLevelTest;

