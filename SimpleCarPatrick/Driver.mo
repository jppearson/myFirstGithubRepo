package Driver

  import Modelica.Blocks.Interfaces.RealInput;
  import Modelica.Blocks.Interfaces.RealOutput;

  
  
  partial model IDriver
    
    RealInput vehiclePosition;
    RealOutput throttle "A throttle value that should be between 0 and 1";
    
  equation
    assert(throttle >= 0, "Negative throttle values are invalid.");
    assert(throttle <= 1, "Throttle value must be less than 1");
    
  end IDriver;
  
  
  
  model SimpleDriver
    extends IDriver;
    
  equation
    throttle = 1;
  
  end SimpleDriver;
  
  
end Driver;