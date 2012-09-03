package Atmosphere

  import Modelica.Media.Air.SimpleAir;
  import Modelica.Fluid.Interfaces.FluidPort;
  import Modelica.Fluid.Sources.Boundary_pT;
  

  
  model SimpleAtmosphere
    
    parameter Modelica.SIunits.AbsolutePressure p = 101325;
    parameter Modelica.SIunits.Temperature T = 298.15;
    
    FluidPort ambient( redeclare package Medium = SimpleAir, m_flow(min = 0) );
    FluidPort exhaust( redeclare package Medium = SimpleAir, m_flow(max = 0) );
    
  protected
    Boundary_pT source( nPorts = 1, p = p, T = T );
    
  equation
    connect( source.ports[1], ambient );
  
  end SimpleAtmosphere;
  


end Atmosphere;
