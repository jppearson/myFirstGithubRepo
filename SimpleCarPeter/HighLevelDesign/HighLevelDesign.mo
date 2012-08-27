package HighLevelDesign
  model Driver
    parameter Real driverMass;
    Real cmdDir;
    parameter Real cmdThrottle;
    parameter Real cmdBreak;
  end Driver;
  model Road
    parameter Real frictionMu;
    Real[2] carPos;
  end Road;
  model Atmosphere
    parameter Real temperature;
    parameter Real airPressure;
    parameter Real timeOfDay;
  end Atmosphere;
  partial model carInterface
    Real[2] position;
    Real totalMass = 200000;
    Real[2] velocity;
    Real[2] acceleration;
    Real[2] F;
    Real stearingWheel;
    Real gasPedal;
    Real breakPedal;
    Real driverMass;
    Real frictionMu;
    Real timeOfDay;
    Real airPressure;
    Real temperature;
  equation
    F[1] = totalMass * acceleration[1];
    F[2] = totalMass * acceleration[2];
    velocity[1] = der(position[1]);
    velocity[2] = der(position[2]);
    acceleration[1] = der(velocity[1]);
    acceleration[2] = der(velocity[2]);
  end carInterface;
end HighLevelDesign;

