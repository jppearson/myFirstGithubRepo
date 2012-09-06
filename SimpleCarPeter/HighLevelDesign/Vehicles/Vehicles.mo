package Vehicles
  import HighLevelDesign.*;
  // Highly Abstracted Model of a Car that outputs a 2d force based on the input gasPedel
  // and the input direction of the stearingWheel
  model DummyCar
    extends HighLevelDesign.CarInterface(totalMass = 20000);
    Real outT;
  equation
    outT = gasPedal * 2;
    F[1] = outT * cos(steeringWheel);
    F[2] = outT * sin(steeringWheel);
  end DummyCar;
  // A slightly more complex car that contains a simple chassis, simple engine, and simple transmission
  model MidLevelCar
    extends HighLevelDesign.CarInterface(totalMass = 30000);
    replaceable Chassis.SimpleChassis chassis;
    replaceable Engines.SimpleEngine engine;
    replaceable Transmissions.SingleSpeedTransmission transmission;
    //replaceable Brakes.SimpleBrake brakes;
    //replaceable HeadLights.SimpleHeadLight headlight;
    Real airIn = 100;
    Real airOut;
  equation
    connect(gasPedal,engine.throttle);
    connect(airIn,engine.intake);
    connect(airOut,engine.exhaust);
    connect(engine.crankshaft,transmission.engine);
    connect(transmission.driveline,chassis.power);
    connect(wheel,chassis.wheel);
    connect(steeringWheel,chassis.steeringWheel);
  end MidLevelCar;
  //connect(chassis.brakes,brakes.breakPad);
  //connect(brakePedal,brakes.brakePedal);
  //connect(timeOfDay,headLight.timeOfDay);
  //connect(headlights,headlight.lightbulb);
end Vehicles;

