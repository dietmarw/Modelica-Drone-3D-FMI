within DroneSimulation.Electrical.Sources;
model AuxiliaryPowerSystem_Battery "Auxiliary power system for drone"
  PowerElectronics.Converters.DCDC.BuckConverter         dcdc annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,0})));
  Modelica.Electrical.PowerConverters.DCDC.Control.SignalPWM pwm(
      constantDutyCycle=0.5, f(displayUnit="kHz") = 100000)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Battery                                                battery(
    redeclare Modelon.Electrical.EnergyStorage.Components.BatteryPackEMF
      stackVoltage,
    V_min=V_min,
    SOC_start=SOC_start)
               annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-82,0})));

  Modelica.Electrical.Analog.Interfaces.PositivePin ac1
                                                       "AC output" annotation (
      Placement(transformation(extent={{-50,90},{-30,110}}),iconTransformation(
          extent={{-50,90},{-30,110}})));
  parameter Modelica.Units.SI.Voltage V=1000 "Fuel cell voltage";
  Modelica.Electrical.Analog.Interfaces.NegativePin dc_n1 "Negative DC output"
    annotation (Placement(transformation(extent={{30,90},{50,110}})));
  parameter Real V_min=0
    "Minimum allowable terminal voltage (simulation terminated if below)";
  parameter Real SOC_start=0.6 "Initial SOC";
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p1 "Positive pin"
    annotation (Placement(transformation(extent={{100,46},{120,66}}),
        iconTransformation(extent={{100,46},{120,66}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n1 "Negative pin"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
        iconTransformation(extent={{100,-50},{120,-30}})));
equation
  connect(dcdc.fire_p, pwm.fire)
    annotation (Line(points={{-56,-12},{-56,-19}}, color={255,0,255}));
  connect(battery.pin_p, dcdc.dc_p1)
    annotation (Line(points={{-73.6667,3.33333},{-68,3.33333},{-68,6},{-60,6}},
                                               color={0,0,255}));
  connect(dcdc.dc_p2, ac1) annotation (Line(points={{-40,6},{-22,6},{-22,100},{
          -40,100}}, color={0,0,255}));
  connect(dcdc.dc_n2, dc_n1) annotation (Line(points={{-40,-6},{16,-6},{16,100},
          {40,100}}, color={0,0,255}));
  connect(battery.pin_n, dcdc.dc_n1) annotation (Line(points={{-73.6667,
          -3.33333},{-66,-3.33333},{-66,-6},{-60,-6}},
                              color={0,0,255}));
  connect(battery.pin_p, pin_p1) annotation (Line(points={{-73.6667,3.33333},{
          -73.6667,56},{110,56}}, color={0,0,255}));
  connect(battery.pin_n, pin_n1) annotation (Line(points={{-73.6667,-3.33333},{
          -73.6667,-28.6667},{110,-28.6667},{110,-40}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-80,60},{80,-80}},
          lineColor={95,95,95},
          fillPattern=FillPattern.Solid,
          fillColor={215,215,215}),
        Line(
          points={{-50,90},{-50,60}},
          color={95,95,95},
          smooth=Smooth.None),
        Line(
          points={{50,90},{50,60}},
          color={95,95,95},
          smooth=Smooth.None),
        Text(
          extent={{90,60},{50,100}},
          lineColor={95,95,95},
          textString="+"),
        Text(
          extent={{-50,60},{-90,100}},
          lineColor={95,95,95},
          textString="-"),
        Line(
          points={{-60,-58},{-60,22}},
          color={95,95,95},
          smooth=Smooth.None),
        Line(
          points={{-40,-58},{-40,22}},
          color={95,95,95},
          smooth=Smooth.None),
        Line(
          points={{-20,-58},{-20,22}},
          color={95,95,95},
          smooth=Smooth.None),
        Line(
          points={{0,-58},{0,22}},
          color={95,95,95},
          smooth=Smooth.None),
        Line(
          points={{20,-58},{20,22}},
          color={95,95,95},
          smooth=Smooth.None),
        Line(
          points={{40,-58},{40,22}},
          color={95,95,95},
          smooth=Smooth.None),
        Line(
          points={{60,-58},{60,22}},
          color={95,95,95},
          smooth=Smooth.None)}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
</html>"),
    experiment(StopTime=0.5));
end AuxiliaryPowerSystem_Battery;
