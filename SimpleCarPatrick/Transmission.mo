package Transmission

  import Modelica.Mechanics.Rotational.Interfaces.Flange_a;
  import Modelica.Mechanics.Rotational.Interfaces.Flange_b;
    
    

  partial model ITransmission
    
    Flange_a driveline;
    Flange_b engine;
  
  end ITransmission;

  
  
  model SimpleTransmission
    extends ITransmission;
  
  equation
    connect( engine, driveline );
  
  end SimpleTransmission;



end Transmission;
