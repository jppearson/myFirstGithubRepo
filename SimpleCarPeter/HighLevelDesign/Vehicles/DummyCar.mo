model DummyCar
  extends HighLevelDesign.carInterface;
  Real outT;
  replaceable Chassis.SimpleChassis chassis;
  replaceable Engine.SimpleEngine engine;
  replaceable Transmission.SingleSpeedTransmission transmission;
equation
  outT = gasPedal * 2;
  F[1] = outT * cos(stearingWheel);
  F[2] = outT * sin(stearingWheel);
  connect(gasPedal, engine.throttle);
  connect(transmission.engine, engine.crankshaft);
  connect(chassis.wheel,stearingWheel);
end DummyCar;

