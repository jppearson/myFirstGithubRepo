model DummyCarTest
  import DummyCar.*;
  import HighLevelDesign.*;
  import Modelica.Constants.*;
  DummyDriver1 driver1();
  //DummyDriver2 driver1();
  DummyCar dummyCar1();
  Atmosphere atmosphere1(temperature = 25, airPressure = 1, timeOfDay = 1);
  Road road1(frictionMu = 0);
equation
  connect(driver1.driverMass,dummyCar1.driverMass);
  connect(driver1.cmdDir,dummyCar1.stearingWheel);
  connect(driver1.cmdThrottle,dummyCar1.gasPedal);
  connect(driver1.cmdBreak,dummyCar1.breakPedal);
  connect(atmosphere1.temperature,dummyCar1.temperature);
  connect(atmosphere1.airPressure,dummyCar1.airPressure);
  connect(atmosphere1.timeOfDay,dummyCar1.timeOfDay);
  connect(road1.frictionMu,dummyCar1.frictionMu);
  connect(road1.carPos,dummyCar1.position);
end DummyCarTest;

