package Vehicles
  import Modelica.SIunits.*;
  import Chassis.*;
  import Engines.*;
  import Transmissions.*;
  import Headlights.*;
  import Brakes.*;
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
  model DummyCar
    extends CarInterface(totalMass = 20000);
    Real outT;
  equation
    outT = gasPedal * 2;
    F[1] = outT * cos(steeringWheel);
    F[2] = outT * sin(steeringWheel);
  end DummyCar;
  // A slightly more complex car that contains a simple chassis, simple engine, and simple transmission
  partial model CarInterface2
    Modelica.SIunits.Mass totalMass;
    Modelica.SIunits.Mass driverMass;
    //Real position;
    //Real velocity;
    //Real acceleration;
    //Real steeringWheel;
    Real gasPedal;
    Real brakePedal;
    //Real frictionMu;
    //Real timeOfDay;
    //Modelica.SIunits.Pressure airPressure;
    //Modelica.SIunits.Temperature airTemperature;
  end CarInterface2;
  //velocity = der(position);
  //acceleration = der(velocity);
  model MidLevelCar
    extends CarInterface2;
    Chassis.SimpleChassis chassis();
    Engines.SimpleEngine engine();
    Transmissions.SingleSpeedTransmission transmission();
    //Brakes.SimpleBrake brakes();
    //Headlights.SimpleHeadlight headlight();
    Modelica.Mechanics.Translational.Interfaces.Flange_b roadSurface;
    //Real headlights;
    Real airIn = 100;
    Real airOut;
  equation
    totalMass = chassis.chassisMass + engine.engineMass + transmission.transmissionMass;
    connect(totalMass,chassis.totalVehicleMass);
    connect(gasPedal,engine.throttle);
    connect(airIn,engine.intake);
    connect(airOut,engine.exhaust);
    connect(engine.crankshaft,transmission.engine);
    connect(transmission.driveline,chassis.power);
    connect(roadSurface,chassis.roadSurface);
  end MidLevelCar;
  //position = roadSurface.s;
  //connect(steeringWheel,chassis.steeringWheel);
  //connect(chassis.brakes,brakes.brakePad);
  //connect(brakePedal,brakes.brakePedal);
  //connect(timeOfDay,headlight.timeOfDay);
  //connect(headlights,headlight.lightBulb);
end Vehicles;

