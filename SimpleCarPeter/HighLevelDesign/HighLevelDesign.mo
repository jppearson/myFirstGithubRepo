package HighLevelDesign
  model Road
    parameter Real frictionMu;
    Real[2] carPos;
  end Road;
  model Atmosphere
    //Modelica.SIunits.Pressure airPressure;
    //Modelica.SIunits.Temperature temperature;
    parameter Real temperature;
    parameter Real airPressure;
    parameter Real timeOfDay;
  end Atmosphere;
  model Driver
    parameter Real driverMass;
    //Modelica.SIunits.Mass driverMass;
    Real cmdDir;
    Real cmdThrottle;
    Real cmdBreak;
  end Driver;
  partial model carInterface
    Real[2] position;
    //Modelica.SIunits.Mass totalMass = 1200;
    Real totalMass = 200000;
    Real[2] velocity;
    Real speed;
    Real[2] acceleration;
    Real[2] F;
    Real stearingWheel;
    Real gasPedal;
    Real breakPedal;
    Real driverMass;
    Real frictionMu;
    Real timeOfDay;
    //Modelica.SIunits.Pressure airPressure;
    //Modelica.SIunits.Temperature temperature;
    Real airPressure;
    Real temperature;
  equation
    F[1] = totalMass * acceleration[1];
    F[2] = totalMass * acceleration[2];
    velocity[1] = der(position[1]);
    velocity[2] = der(position[2]);
    acceleration[1] = der(velocity[1]);
    acceleration[2] = der(velocity[2]);
    speed = sqrt(velocity[1] ^ 2 + velocity[2] ^ 2);
  end carInterface;
end HighLevelDesign;

