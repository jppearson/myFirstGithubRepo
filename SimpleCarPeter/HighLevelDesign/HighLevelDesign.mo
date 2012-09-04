package HighLevelDesign
  import Modelica.SIunits.*;
  model Road
    Real frictionMu;
    Real[2] carPos;
  end Road;
  partial model AtmosphereInterface
    //AtmosophereComponents.Gas air;
    parameter Modelica.SIunits.Pressure P;
    parameter Modelica.SIunits.Temperature T;
    parameter Real timeOfDay;
  end AtmosphereInterface;
  partial model DriverInterface
    Modelica.SIunits.Mass driverMass;
    Real cmdDir;
    Real cmdThrottle;
    Real cmdBrake;
  end DriverInterface;
  partial model CarInterface
    Real[2] position;
    Modelica.SIunits.Mass totalMass;
    Modelica.SIunits.Mass driverMass;
    Real[2] velocity;
    Real speed;
    Real[2] acceleration;
    Real[2] F;
    Real steeringWheel;
    Real gasPedal;
    Real brakePedal;
    Real frictionMu;
    Real timeOfDay;
    Modelica.SIunits.Pressure airPressure;
    Modelica.SIunits.Temperature airTemperature;
  equation
    F[1] = totalMass * acceleration[1];
    F[2] = totalMass * acceleration[2];
    velocity[1] = der(position[1]);
    velocity[2] = der(position[2]);
    acceleration[1] = der(velocity[1]);
    acceleration[2] = der(velocity[2]);
    speed = sqrt(velocity[1] ^ 2 + velocity[2] ^ 2);
  end CarInterface;
end HighLevelDesign;

