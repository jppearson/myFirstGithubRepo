package Controllers
  //////////////////////////
  partial block Controller "A generic controller interface"
    import Modelica.Blocks;
    Blocks.Interfaces.RealInput command "Command signal";
    Blocks.Interfaces.RealInput sensor "Sensor signal";
    Blocks.Interfaces.RealOutput driver "Driver output signal";
  end Controller;
  //////////////////////////
  ///////////////////////////
  block PetersController
  end PetersController;
  ///////////////////////////
  block PatricksController
  end PatricksController;
  ///////////////////////////
  block AlexsController
  end AlexsController;
  ///////////////////////////
  block PController "A proportional gain controller"
    extends Controller;
    parameter Real Kp = 1 "Proportional gain";
  protected
    Real e "reference error";
  equation
    e = command - sensor;
    driver = Kp * e;
  end PController;
end Controllers;

