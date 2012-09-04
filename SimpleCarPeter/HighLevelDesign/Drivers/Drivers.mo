package Drivers
  import HighLevelDesign.*;
  import Modelica.Constants.*;
  //Simple Driver that travels in a single direction and applys a constant throttle
  //Simple Driver that travels in a direction of pi/4 and incrementally increases the throttle
  //at 4 preset time intervals
  
  model DummyDriver2
    extends HighLevelDesign.DriverInterface(driverMass = 100000);
    parameter Real[4] t = {100,200,300,400};
  equation
    cmdBrake = 0;
    cmdDir = 0;
    cmdThrottle = if time < t[1] then 100 else if time < t[2] then 200 else if time < t[3] then 400 else 800;
  end DummyDriver2;
  
  model DummyDriver1
    extends HighLevelDesign.DriverInterface(driverMass = 100000);
  equation
    cmdBrake = 0;
    cmdDir = 0;
    cmdThrottle = 100;
  end DummyDriver1;
  
  model SimpleDriver
  	extends HighLevelDesign.DriverInterface(driverMass = 100000);
  	parameter Real[4] t = {100,200,300,400};
  equation
  	cmdBrake = 0;
  	cmdDir = 0;
  	cmdThrottle = if time < t[1] then 0.2 else if time < t[2] then 0.4 else if time < t[3] then 0.8 else 1.0;
end Drivers;

