model DummyCar
  extends HighLevelDesign.carInterface;
  Real outT;
equation
  outT = gasPedal * 2;
  F[1] = outT * cos(stearingWheel);
  F[2] = outT * sin(stearingWheel);
end DummyCar;

