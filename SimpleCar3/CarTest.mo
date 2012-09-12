package CarTest
  import Vehicles.MidLevelCar;
  import Modelica.Mechanics.Translational.Interfaces.Flange_a;
  model MidLevelCarTest
    Real atmosphere;
    Modelica.Mechanics.Translational.Interfaces.Flange_a sampleSurface();
    Vehicles.MidLevelCar car(gasPedal = 0.5, airIn = 5, driverMass = 100);
  equation
    connect(car.roadSurface,sampleSurface);
    connect(atmosphere,car.airOut);
  end MidLevelCarTest;
end CarTest;

