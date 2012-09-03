package Chassis

  import Modelica.Mechanics.*;
  
  

  partial model IChassis
    
    Rotational.Interfaces.Flange_a power;
    Translational.Interfaces.Flange_a carFlange;
    Translational.Interfaces.Flange_b wheel;
    
  end IChassis;

  
  
  model SimpleChassis
    extends IChassis;
    
    parameter Modelica.SIunits.Length wheelRadius = 0.3;
    
    Translational.Components.Mass mass( m = 1000 );
    Rotational.Components.IdealRollingWheel wheelComponent( radius = wheelRadius, useSupportT = true );
    
  equation
    connect( power, wheelComponent.flangeR );
    connect( wheelComponent.flangeT, mass.flange_a );
    connect( mass.flange_b, carFlange );
    connect( wheelComponent.supportT, wheel );
  
  end SimpleChassis;
  
  

end Chassis;