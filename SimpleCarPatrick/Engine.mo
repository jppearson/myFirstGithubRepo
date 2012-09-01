package Engine

  import Modelica.Blocks.Interfaces.RealInput;
  import Modelica.Fluid.Interfaces.FluidPort;
  import Modelica.Media.Air.SimpleAir;
  import Modelica.Mechanics.Rotational.Interfaces.Flange_a;
  
  

  partial model IEngine
  
    RealInput throttle;
    //FluidPort intake( redeclare package Medium = SimpleAir );
    //FluidPort exhaust( redeclare package Medium = SimpleAir );
    Flange_a crankshaft;
  
  end IEngine;


  
  model SimpleEngine
    extends IEngine;
    
    parameter Modelica.SIunits.Torque maxTorque = 100;
    
    Modelica.Mechanics.Rotational.Sources.Torque torque;
    
  equation
    torque.tau = throttle * maxTorque;
    
    connect( torque.flange, crankshaft );
    //connect( intake, exhaust );
    
  end SimpleEngine;



end Engine;