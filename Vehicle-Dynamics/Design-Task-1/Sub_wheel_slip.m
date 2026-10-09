function slip=Sub_wheel_slip(v,w,CONST)

%----Calculate the slip----------------------------------------------------
%----Write your solution below---------------------------------------------
R = CONST.R;  % Wheel radius from CONST
v_wheel = w * R;  % Linear velocity at the wheel
slip = (v_wheel - v) / v_wheel;  % Slip ratio
%--------------------------------------------------------------------------
end