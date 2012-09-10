package Vehicles
  import SimpleCarPeter.HighLevelDesign.*;
  import Modelica.Mechanics.*;
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
    extends HighLevelDesign.CarInterface;
    replaceable Chassis.SimpleChassis chassis();
    replaceable Engines.SimpleEngine engine();
    replaceable Transmissions.SingleSpeedTransmission transmission();
    replaceable Brakes.SimpleBrake brakes();
    replaceable Headlights.SimpleHeadlight headlight();
    Modelica.Mechanics.Translational.Interfaces.Flange_b roadSurface;
	Real headlights;
    Real airIn = 100;
    Real airOut;
  equation
    totalMass = chassis.chassisMass + engine.engineMass + transmission.transmissionMass + brakes.brakeMass + headlight.headlightMass;
    connect(totalMass,chassis.totalVehicleMass);
    connect(gasPedal,engine.throttle);
    connect(airIn,engine.intake);
    connect(airOut,engine.exhaust);
    connect(engine.crankshaft,transmission.engine);
    connect(transmission.driveline,chassis.power);
    connect(steeringWheel,chassis.steeringWheel);
    connect(chassis.brakes,brakes.breakPad);
    connect(brakePedal,brakes.brakePedal);
    connect(timeOfDay,headlight.timeOfDay);
    connect(headlights,headlight.lightBulb);
    connect(roadSurface,chassis.roadSurface);
  end MidLevelCar;
end Vehicles;

