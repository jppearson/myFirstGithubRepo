model runSimulation
  fuelTank smFT(tareMass = 10, maxCapacity = 1000);
  fuelTank medFt(tareMass = 25, maxCapacity = 4000);
  fuelTank lgFt(tareMass = 50, maxCapacity = 10000);
  fuelPump smFP(mass = 2, maxDp = 5, A = 0.08, T = 3);
  fuelPump medFP(mass = 5, maxDp = 15, A = 0.1, T = 5);
  fuelPump lgFP(mass = 7, maxDp = 23, A = 0.15, T = 6);
  thruster smThruster(mass = 50, rMax = 2, n = 3, K = 10000, LagK = 1);
  thruster medThruster(mass = 70, rMax = 3.6, n = 3, K = 23000, LagK = 2);
  thruster largeThruster(mass = 100, rMax = 3.7, n = 3, K = 32000, LagK = 2.2);
  vehicle peterVehicle(FT = smallFT, FP = smallFP, vThruster = smallThruster);
end runSimulation;

