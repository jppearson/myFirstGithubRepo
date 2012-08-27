package petersVehicle
  model vehicle
    import Modelica.Math.*;
    Real totalMass;
    // Total Mass of vehicle
    Real[2] F;
    // Force acting on the vehicle
    Real[2] pos;
    // Starting Position of the Vechicle
    Real[2] v;
    // Starting Velocity of the Vechicle
    Real[2] a;
    // Starting Acceleration of the Vechicle
    parameter Real[2] enemyPos = {0,0};
    //Real[2] enemyV;
    fuelTank FT(tareMass = 25, maxCapacity = 4000);
    fuelPump FP(mass = 5, maxDp = 15, A = 0.1, T = 5);
    thruster vThruster(mass = 70, rMax = 3.6, n = 4, K = 23000, LagK = 2);
    vehicleController controller();
  equation
    totalMass = FT.mass + FP.mass + vThruster.mass;
    der(pos[1]) = v[1];
    der(pos[2]) = v[2];
    der(v[1]) = a[1];
    der(v[2]) = a[2];
    F[1] = totalMass * a[1];
    F[2] = totalMass * a[2];
    connect(enemyPos,controller.enemyPos);
    connect(pos,controller.selfPos);
    connect(F,vThruster.outT);
    connect(controller.cmdDir,vThruster.cmdDir);
    connect(controller.cmdThrust,vThruster.cmdT);
    connect(vThruster.fuelBurnRate,FP.fuelRateOut);
    connect(vThruster.fuelRateControl,FP.cmdPumpRate);
    connect(FP.fuelRateIn,FT.fuelRateOut);
    connect(FP.fuelTankLoss,FT.fuelRateCmd);
  end vehicle;
  model fuelPump
    import Modelica.Blocks.Continuous.*;
    parameter Real mass;
    // mass of fuel pump
    parameter Real maxDp;
    // max delta Pressure
    parameter Real A;
    // Pipe Cross-Sectional Area
    parameter Real T;
    // Cmd-To-Actuall time constant
    parameter Real C = 1;
    // Orifice Constant
    parameter Real rho = 1000;
    // Fuel Density
    Real cmdPumpRate;
    Real fuelRateIn;
    Real fuelRateOut;
    Real fuelTankLoss;
    Real currDp;
    TransferFunction pumpDelay(b = {1}, a = {T,1});
  equation
    connect(pumpDelay.u,fuelRateIn);
    connect(pumpDelay.y,fuelRateOut);
    cmdPumpRate = C * A * sqrt(2 * rho * currDp);
    fuelTankLoss = if currDp < maxDp then cmdPumpRate else C * A * sqrt(2 * rho * maxDp);
  end fuelPump;
  model fuelTank
    Real mass;
    parameter Real tareMass;
    parameter Real maxCapacity;
    Real currFuel(start = maxCapacity);
    Real fuelRateCmd;
    Real fuelRateOut;
    // Current fuelRate to fuelPump
  equation
    mass = tareMass + currFuel;
    der(currFuel) = -fuelRateOut;
    fuelRateOut = if currFuel > 0 then fuelRateCmd else 0;
  end fuelTank;
  model thruster
    // The Thruster takes an input direction, and cmd Thrust to output from controller
    // and outputs a vector Thrust output to the vehicle
    import Modelica.Blocks.Continuous.*;
    import Modelica.Math.*;
    parameter Real mass;
    parameter Real rMax;
    // Max Fuel Burn Rate
    parameter Real n;
    // Fuel Burn Efficiency
    parameter Real K;
    // Asymptotic Max Thrust
    parameter Real LagK;
    // Direction lag-time constant
    Real cmdDir;
    // input direction from controller
    Real actDir;
    TransferFunction g(b = {1}, a = {LagK,1});
    // Cmd-To-Actuall Transfer Function 
    Real cmdT;
    // target  thrust output from controller
    Real fuelBurnRate;
    // current Fuel Burn Rate the thruster needs to burn
    Real fuelRateControl;
    // Send to fuel pump
    Real[2] outT;
    // Output thrust to vehicle
    Real outTMag;
  equation
    connect(g.u,cmdDir);
    connect(g.y,actDir);
    fuelRateControl = if -n * log(1 - cmdT / K) < rMax then -n * log(1 - cmdT / K) else rMax;
    outTMag = K * (1 - exp(-fuelBurnRate / n));
    outT[1] = outTMag * cos(actDir);
    outT[2] = outTMag * sin(actDir);
  end thruster;
  //if time < t[1] then pi / 4 else if time < t[2] then 0 else if time < t[3] then (3 * pi) / 4 else pi / 4;
  //if time < t[1] then maxThrust3 else if time < t[2] then maxThrust1 else if time < t[3] then maxThrust2 else maxThrust4;
  model vehicleController
    import Modelica.Constants.pi;
    Real[2] enemyPos;
    // Input target position and Velocity
    // Real[2] enemyV;
    Real[2] selfPos;
    Real maxThrust;
    // Input Self Pos and Velocity
    //Real[2] selfV();
    /*parameter Real maxThrust3 = 1000;
  parameter Real maxThrust1 = 5000;
  parameter Real maxThrust2 = 10000;
  parameter Real maxThrust4 = 20000;
  parameter Real maxThrust5 = 23000;
  parameter Real[4] t = {500,1000,2000,4000};
/*/
    Real cmdDir;
    // Ouput Direction to thruster
    Real cmdThrust;
    // Magnitude Thrust to thruster
  equation
    cmdDir = atan2(selfPos[2] - enemyPos[2], selfPos[1] - enemyPos[1]);
    cmdThrust = maxThrust;
  end vehicleController;
end petersVehicle;

