package Road
  import Modelica.Mechancis.Translational.Interfaces.Flange_a;
  model Road
    parameter Real frictionMu = 0;
    Real[2] carPos;
  end Road;
  model MidLevelRoad
    parameter Real frictionMu = 0;
    Real carPosition;
    Modelica.Mechanics.Translational.Interfaces.Flange_a surface;
  end MidLevelRoad;
end Road;

