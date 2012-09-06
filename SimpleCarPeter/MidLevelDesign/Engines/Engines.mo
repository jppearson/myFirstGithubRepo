package Engines
  import MidLevelDesign.*;
  //SimpleEngine Model that creates a generic torque source from the standard modelica library
  //and uses it to drive the crankshaft. The intake is connected directly to the exhaust at this time
  model SimpleEngine
    extends EngineInterface(engineMass = 300);
    parameter Modelica.SIunits.Torque maxTorque = 100;
    Modelica.Mechanics.Rotational.Sources.Torque torqueSource();
  equation
    torqueSource.tau = throttle * maxTorque;
    connect(torqueSource.flange,crankshaft);
    connect(intake,exhaust);
  end SimpleEngine;
end Engines;

