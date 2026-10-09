%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vehicle Dynamics, MMF062, 2020
% Vertical assignment, Task 1
%
% Add your own code where "%ADD YOUR CODE HERE" is stated
%
clear all;
close all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load parameters from file "InitParameters.m"

InitParametersSkeleton


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Task 1.3
%
% Consider one single front wheel, identify sprung mass and unsprung mass

sprungMassFront =   (totalSprungMass*0.6)/2;
unsprungMassFront = 185/4;

% Identify indiviual A and B matrix
Af =  [0 0 1 0; 0 0 0 1; -(frontWheelSuspStiff/sprungMassFront) (frontWheelSuspStiff/sprungMassFront)  -(frontWheelSuspDamp/sprungMassFront)  (frontWheelSuspDamp/sprungMassFront);  (frontWheelSuspStiff/unsprungMassFront)  -((frontWheelSuspStiff + tireStiff)/unsprungMassFront) (frontWheelSuspDamp/unsprungMassFront) -((frontWheelSuspDamp + tireDamp)/unsprungMassFront)];
Bf =  [0; 0; 0; (tireStiff/unsprungMassFront)];

% Calculate transfer functions for 
% 1)front wheel Zr to Ride, 
% 2)front wheel Zr to Suspension travel and 
% 3) front wheel Zr to Tyre force

% matrices Zr to Ride,front wheel:
C1f = [1  0  0  0];
D1f = [0];

% matrices for Zr to Suspension travel, front wheel:
C2f = [-1  1  0  0];
D2f = [0];

% matrices for Zr to Zr to Tyre force, front wheel:
C3f = [0  1  0  0];
D3f = [0];

transferFunctionFrontZrToRide = zeros(length(angularFrequencyVector),1);
transferFunctionFrontZrToTravel = zeros(length(angularFrequencyVector),1);
transferFunctionFrontZrToForce = zeros(length(angularFrequencyVector),1);

for j = 1 : length(angularFrequencyVector)
    % Calculate H(w) not the absolut value |H(w)|
    transferFunctionFrontZrToRide(j,:) = (-w(j))^2 * (C1f * inv(1j * w(j) * eye(4) - Af) * Bf + D1f);
    transferFunctionFrontZrToTravel(j,:) = (C2f * inv(1j * w(j) * eye(4) - Af) * Bf + D2f);
    transferFunctionFrontZrToForce(j,:) = tireStiff * (1 - (C3f * inv(1j * w(j) * eye(4) - Af) * Bf+ D3f));
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Consider one single rear wheel, identify sprung mass and unsprung mass

sprungMassRear = (totalSprungMass*0.4)/2;
unsprungMassRear = 185/4;

% Identify indiviual A and B matrix
Ar =  [0 0 1 0; 0 0 0 1; -(rearWheelSuspStiff/sprungMassRear) (rearWheelSuspStiff/sprungMassRear) -(rearWheelSuspDamp/sprungMassRear) (rearWheelSuspDamp/sprungMassRear); (rearWheelSuspStiff/unsprungMassRear) -((rearWheelSuspStiff+tireStiff)/unsprungMassRear)  (rearWheelSuspDamp/unsprungMassRear)  -((rearWheelSuspDamp+tireDamp)/unsprungMassRear)];
Br =  [0; 0; 0; (tireStiff/unsprungMassRear)];

% Calculate transfer functions for 
% 1) rear wheel Zr to Ride, 
% 2) rear wheel Zr to Suspension travel and 
% 3) rear wheel Zr to Tyre force

% matrices Zr to Ride, rear wheel:
C1r = [1  0  0  0]
D1r = [0];

% matrices for Zr to Suspension travel, rear wheel:
C2r = [-1  1  0  0];
D2r = [0];

% matrices for Zr to Zr to Tyre force, rear wheel:
C3r = [0  1  0  0];
D3r = [0];

% Rear wheel     
transferFunctionRearZrToRide = zeros(length(angularFrequencyVector),1);
transferFunctionRearZrToTravel = zeros(length(angularFrequencyVector),1);
transferFunctionRearZrToForce = zeros(length(angularFrequencyVector),1);


for j = 1 : length(angularFrequencyVector)
    % Calculate H(w) not the absolut value |H(w)|
    transferFunctionRearZrToRide(j,:) = (-w(j))^2 * (C1r * inv(1j * w(j) * eye(4) - Ar) * Br + D1r);
    transferFunctionRearZrToTravel(j,:) = (C2r * inv(1j * w(j) * eye(4) - Ar) * Br + D2r);
    transferFunctionRearZrToForce(j,:) = tireStiff * (1 - (C3r * inv(1j * w(j) * eye(4) - Ar) * Br + D3r));
end

% Plot the transfer functions
figure;
semilogx(frequencyVector,db(abs(transferFunctionFrontZrToRide)),'-b',...
    frequencyVector,db(abs(transferFunctionRearZrToRide)),'--r');
axis([0 50 -10 60]);grid
legend('Front','Rear','Location','northwest');
xlabel('Frequency (Hz)');
ylabel('dB');
title('Magnitude of transfer function Ride Comfort');

figure;
semilogx(frequencyVector,db(abs(transferFunctionFrontZrToTravel)),'-b',...
    frequencyVector,db(abs(transferFunctionRearZrToTravel)),'--r');
axis([0 50 -50 10]);grid
legend('Front','Rear','Location','northwest');
xlabel('Frequency (Hz)');
ylabel('dB');
title('Magnitude of transfer function Suspension Travel');

figure;
semilogx(frequencyVector,db(abs(transferFunctionFrontZrToForce)),'-b',...
    frequencyVector,db(abs(transferFunctionRearZrToForce)),'--r');
axis([0 50 40 115]);grid
legend('Front','Rear','Location','northwest');
xlabel('Frequency (Hz)');
ylabel('dB');
title('Magnitude of transfer function Road Grip');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Task 1.4
%
% Identify natural frequencies

% Front wheel
resonanceFreqFrontBounce = sqrt((1/((1/frontWheelSuspStiff)+(1/tireStiff)))/sprungMassFront);
FreqFrontBounce = resonanceFreqFrontBounce / (2 * pi);

resonanceFreqFrontHop = sqrt((frontWheelSuspStiff + tireStiff)/unsprungMassFront);
FreqFrontHop = resonanceFreqFrontHop / (2 * pi);

% Rear wheel
resonanceFreqRearBounce = sqrt((1/((1/rearWheelSuspStiff)+(1/tireStiff)))/sprungMassRear);
FreqRearBounce = resonanceFreqRearBounce / (2 * pi);

resonanceFreqRearHop = sqrt((rearWheelSuspStiff + tireStiff)/unsprungMassRear);
FreqRearHop = resonanceFreqRearHop / (2 * pi);

