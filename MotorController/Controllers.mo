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
  ///////////////////////////
  block PatricksController
    extends Controller;
	parameter Real Kp = 1;
	parameter Real Ki = 1;
	parameter Real Kd = 1;
  protected
    Real e;
	Real I ( start = 0 );
	Real D;
  equation
    e = command - sensor;
	e = der(I);
	D = der(e);
	driver = Kp * e + Ki * I; // Adding the derivative term gives a "divide by zero" error
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
  block PetersController "Peters Proportional Controller"
    extends Controller;
    parameter Real Kp = 1;
    //Default Proportional Gain
  protected
    Real e;
    //reference Error
  equation
    e = command - sensor;
    driver = Kp * e;
  end PetersController;
end Controllers;

