model fuelTank
  Real mass;
  parameter Real tareMass;
  parameter Real maxCapacity;
  Real currFuel(start = maxCapacity);
  Real fuelRateCmd;
  // From Thruster
  Real fuelRateOut;
  // To fuelPump
equation
  mass = tareMass + currFuel;
  der(currFuel) = -fuelRateOut;
  fuelRateOut = if currFuel <= 0 then fuelRateOut else 0;
end fuelTank;

