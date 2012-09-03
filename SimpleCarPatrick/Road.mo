package Road

  import Modelica.Mechanics.Translational.Interfaces.Flange_a;
  import Modelica.Mechanics.Translational.Components.Fixed;
  
  

  partial model IRoad
  
    Flange_a surface;
  
  end IRoad;

  
  
  model SimpleRoad
    extends IRoad;
    
    Fixed ground;
    
  equation
    connect( ground.flange, surface );
    
  end SimpleRoad;
    


end Road;