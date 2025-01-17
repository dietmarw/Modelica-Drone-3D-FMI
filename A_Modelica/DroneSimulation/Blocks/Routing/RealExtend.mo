within DroneSimulation.Blocks.Routing;
model RealExtend
  "Pass a Real signal through without modification"

  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}}),
        iconTransformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y[3]
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  y = {0,0,u};
  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
            -100},{100,100}}), graphics={Line(points={{-100,0},{100,0}},
            color={0,0,127}), Rectangle(extent={{-100,100},{100,-100}},
            lineColor={28,108,200}),
        Line(points={{-80,0}}, color={81,255,0}),
        Line(points={{-100,0},{0,60},{100,60}},color={28,108,200}),
        Line(points={{-100,0},{100,0},{100,-60},{0,-60},{-100,0}},
                                                                 color={28,
              108,200})}),
                    Documentation(info="<html>
<p>Passes a Real signal through without modification. This enables a single input to enter the system, then translates the signal into an array. </p>
<p>For example, an input of u=x will have an output of y = [0,0,x].</p>
</html>"));
end RealExtend;
