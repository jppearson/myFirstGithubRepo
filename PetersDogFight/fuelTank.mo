model fuelTank
  Real mass;
  parameter Real tareMass;
  parameter Real maxCapacity;
  Real currFuel(start = maxCapacity);
  Real fuelRateCmd;  // From Thruster
  Real fuelRateOut;
  // Current fuelRate to fuelPump
equation
  mass = tareMass + currFuel;
  der(currFuel) = -fuelRateOut;
  fuelRateOut = if currFuel > 0 then fuelRateCmd else 0;
end fuelTank;

