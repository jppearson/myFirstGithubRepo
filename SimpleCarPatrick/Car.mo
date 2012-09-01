package Car

  import Modelica.Blocks.Interfaces.RealInput;
  import Modelica.Blocks.Interfaces.RealOutput;
  import Modelica.Fluid.Interfaces.FluidPort;
  import Modelica.Media.Air.SimpleAir;
  import Modelica.Mechanics.Translational.Interfaces.Flange_a;
  import Modelica.Mechanics.Translational.Interfaces.Flange_b;
  
  
  
  partial model ICar
    
    RealInput throttle;
    RealOutput position;
    //FluidPort intake( redeclare package Medium = SimpleAir );
    //FluidPort exhaust( redeclare package Medium = SimpleAir );
    Flange_a wheel;
    Flange_b carFlange;
  
  end ICar;
  
  

  model SimpleCar
    extends ICar;
    
    replaceable Chassis.SimpleChassis chassis;
    replaceable Engine.SimpleEngine engine;
    replaceable Transmission.SimpleTransmission transmission;
  
  equation
    position = carFlange.s;
  
    //connect( intake, engine.intake );
    //connect( exhaust, engine.exhaust );
    connect( throttle, engine.throttle );
    connect( engine.crankshaft, transmission.engine );
    connect( transmission.engine, chassis.power );
    connect( chassis.wheel, wheel );
    connect( chassis.carFlange, carFlange );
  
  end SimpleCar;



end Car;