model runSimulation
  fuelTank smallFT(tareMass = 10, maxCapacity = 1000);
  fuelTank medFt(tareMass = 25, maxCapacity = 4000);
  fuelTank lgFt(tareMass = 50, maxCapacity = 10000);
  fuelPump smallFP(mass = 2, maxDp = 5, A = 0.08, T = 3);
  //	thruster smallThruster();
  vehicle peterVehicle(FT = smallFT, FP = smallFP, vThruster = smallThruster);
end runSimulation;

