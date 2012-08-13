model Vector
  import Modelica.Math.*;
  Real x;
  Real y;
  Real theta;
  Real magnitude;
equation
  theta = atan(y / x);
  magnitude = sqrt(x ^ 2 + y ^ 2);
end Vector;

