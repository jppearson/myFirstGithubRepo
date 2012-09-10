package EngineTest
  import Engines.*;
  model SimpleEngineTest
    Engines.SimpleEngine engine();
    parameter Real cmdThrottle = 0.5;
    parameter Real testIntake = 1;
  equation
    connect(testIntake,engine.intake);
    connect(cmdThrottle,engine.throttle);
  end SimpleEngineTest;
end EngineTest;

