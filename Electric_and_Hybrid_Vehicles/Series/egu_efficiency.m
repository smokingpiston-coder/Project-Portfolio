function n = egu_efficiency(T_ice, w_ice,bsfc,p_egu,LHV)
%EGU_EFFICIENCY

p_ice = T_ice .* w_ice; % ICE power [w]
m_fuel = (bsfc * p_ice / 1e3) / 3600; % % [kg/s]
n = p_egu ./ (m_fuel .* LHV); % EGU efficiency

end

