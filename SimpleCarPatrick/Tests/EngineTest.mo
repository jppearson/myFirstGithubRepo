model EngineTest

  Engine.SimpleEngine engine;
  Modelica.Blocks.Interfaces.RealOutput throttle;
  //Modelica.Fluid.Sources.Boundary_pT ambient( nPorts = 1, p = 101325, T = 298.15 );
  //Modelica.Fluid.Interfaces.FluidPort exhaust( redeclare package Medium = Modelica.Media.Air.SimpleAir );
  Modelica.Mechanics.Rotational.Components.Inertia testmass( J = 1 );
  
equation
  throttle = 1;
  
  connect( throttle, engine.throttle );
  //connect( ambient.ports[1], engine.intake );
  //connect( exhaust, engine.exhaust );
  connect( engine.crankshaft, testmass.flange_a );
  
end EngineTest;