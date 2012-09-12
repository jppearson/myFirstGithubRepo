package Engines
  import Modelica.Mechanics.Rotational.Interfaces.Flange_a;
  import Modelica.SIunits.Mass;
  import Modelica.Mechanics.Rotational.Sources.Torque;
  partial model EngineInterface
    Modelica.SIunits.Mass engineMass;
    Real throttle;
    Modelica.Mechanics.Rotational.Interfaces.Flange_a crankshaft;
    Real intake;
    Real exhaust;
  end EngineInterface;
  model SimpleEngine
    extends EngineInterface(engineMass = 300);
    Modelica.SIunits.Torque maxTorque = 100;
    Modelica.Mechanics.Rotational.Sources.Torque torqueSource();
  equation
    torqueSource.tau = throttle * maxTorque;
    connect(torqueSource.flange,crankshaft);
    connect(intake,exhaust);
  end SimpleEngine;
end Engines;

