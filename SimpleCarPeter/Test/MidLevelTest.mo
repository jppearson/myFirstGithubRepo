model MidLevelTest
  // Peter Verlangieri
  // September 3, 2012
  // A MidLevelTest that contains a slightly more complicated Vehicle, and driver. Used to test the
  // implementation of the MidLevelComponents of the MidLevelCar
  import HighLevelDesign.*;
  import MidLevelDesign.*;
  import Vehicles.MidLevelCar;
  import Atmospheres.SimpleAtmosphere;
  import Drivers.MidLevelDriver;
  import Modelica.Constants.*;
  MidLevelDriver driver();
  MidLevelCar car();
  SimpleAtmosphere atmosphere();
  MidLevelRoad road(frictionMu = 0);
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
  connect(road.surface,car.roadSurface);
end MidLevelTest;

