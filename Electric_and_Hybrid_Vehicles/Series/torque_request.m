function T_req = torque_request(p_demand,w)
%TORQUE_REQUEST

T = zeros(1,length(w));
for i= 1:length(p_demand)
    for j = 1:length(w)
       T(i,j) = (p_demand(i)*10^3)/(w(j)*2*pi/60);       
    end
end

% remove first line with power = 0
T_req = T(2:end,:);
end

