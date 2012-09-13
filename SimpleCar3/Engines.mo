package Engines
  import Modelica.Mechanics.Rotational.Interfaces.Flange_a;
  import Modelica.SIunits.Mass;
  import Modelica.Mechanics.Rotational.Sources.TorqueStep;
  import Modelica.Mechanics.Rotational.Sources.Torque;
  partial model EngineInterface
    Modelica.SIunits.Mass engineMass;
    Real throttle;
    Modelica.Mechanics.Rotational.Interfaces.Flange_a crankshaft;
    Real intake;
    Real exhaust;
  end EngineInterface;
  model SimpleEngine
    extends EngineInterface(engineMass = 100);
    Modelica.SIunits.Torque maxTorque = 100;
    Real engineTorque;
    Modelica.Mechanics.Rotational.Sources.Torque torqueSource();
    //Modelica.Mechanics.Rotational.Sources.TorqueStep torqueSource(stepTorque = 100, offsetTorque = 0, startTime = 0.1, useSupport = false);
  equation
    engineTorque = maxTorque * throttle;
    connect(engineTorque,torqueSource.tau);
    connect(torqueSource.flange,crankshaft);
    connect(intake,exhaust);
  end SimpleEngine;
  //torqueSource.stepTorque = throttle * maxTorque;
end Engines;

