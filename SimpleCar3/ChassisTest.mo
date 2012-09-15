package ChassisTest
  import Chassis.SimpleChassis;
  import Modelica.Mechanics.Translational.Interfaces.Flange_b;
  import Modelica.Mechanics.Rotatioanl.Sources.TorqueStep;
  model SimpleChassisTest
    Modelica.Mechanics.Translational.Interfaces.Flange_b surface();
    Modelica.Mechanics.Rotational.Sources.TorqueStep torqueSource(stepTorque = 10, offsetTorque = 0, startTime = 0.1, useSupport = false);
    //Modelica.Mechanics.Rotational.Sources.Torque torqueSource(tau = 100, useSupport = false);
    Chassis.SimpleChassis chassis();
  equation
    connect(chassis.power,torqueSource.flange);
    connect(chassis.roadSurface,surface);
  end SimpleChassisTest;
end ChassisTest;

