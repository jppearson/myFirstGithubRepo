package Drivers
  import Modelica.SIunits.Mass;
  partial model DriverInterface
    Modelica.SIunits.Mass driverMass();
    Real cmdDir;
    Real cmdThrottle;
    Real cmdBrake;
  end DriverInterface;
  model DummyDriver2
    extends DriverInterface(driverMass = 100000);
    parameter Real[4] t = {100,200,300,400};
  equation
    cmdBrake = 0;
    cmdDir = 0;
    cmdThrottle = if time < t[1] then 100 else if time < t[2] then 200 else if time < t[3] then 400 else 800;
  end DummyDriver2;
  model DummyDriver1
    extends DriverInterface(driverMass = 100000);
  equation
    cmdBrake = 0;
    cmdDir = 0;
    cmdThrottle = 100;
  end DummyDriver1;
  model MidLevelDriver
    extends DriverInterface(driverMass = 100000);
    parameter Real[4] t = {100,200,300,400};
  equation
    cmdBrake = 0;
    cmdDir = 0;
    cmdThrottle = if time < t[1] then 0.2 else if time < t[2] then 0.4 else if time < t[3] then 0.8 else 1.0;
  end MidLevelDriver;
end Drivers;

