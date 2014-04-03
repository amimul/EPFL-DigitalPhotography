% Frederic Jacobs

function ex2_frederic_jacobs()

clc
clear all
close all

load exe2;

plotRange = linspace(400, 700, 31);

%% Answer to Question 1

%%% 1.1 
% We want to plot 3 illuminants on the same plot where the axis X
% represents the Wavelength and the Y axis the relative power.

figure
plotDataset = [normalizeDataset(D65), normalizeDataset(A), normalizeDataset(F2)];
plot(plotRange ,plotDataset);
title('1.1 : Graph of D65, A and F2 illuminants');
setAxisLabels();
legend('D65', 'A','F2');
pause;

% TO-DO: Can you already determine the effect of the different illuminants
% on the final image?

%%% 1.2 Drawing reflectance

% We extract the two samples needed (130,160) and (290,320)

vector1 = S(:,130,160);
vector2 = S(:,290,320);

plotDataset = [normalizeDataset(D65), normalizeDataset(A), normalizeDataset(F2), normalizeDataset(vector1), normalizeDataset(vector2)];
plot(plotRange ,plotDataset);
title('1.2: Graph of D65, A and F2 illuminants with respective reflectance spectras');
setAxisLabels();
legend('D65', 'A','F2', 'Reflectance of (130, 160)', 'Reflectance of (290, 320)');

pause;

% TO-DO: What colors do these reflectances represent?

%%% 1.3

plotDataset = [normalizeDataset(D65), normalizeDataset(A), normalizeDataset(F2), normalizeDataset(vector1), normalizeDataset(vector2), computeCameraSensitivity(10), computeCameraSensitivity(100)];
plot(plotRange, plotDataset);
title('1.3: Graph of camera sensitivities');
setAxisLabels();
legend('D65', 'A','F2', 'Reflectance of (130, 160)', 'Reflectance of (290, 320)', 'Camera sensitivity for sigma = 10', 'Camera sensitivity for sigma = 100');

% TO-DO: What effects will the different sensistivity functions have on the
% final image?

pause;

close all;
clear all;

%% Answer to Question 2


%% Answer to Question 3


%% Answer to Question 4


%% Answer to Question 5


%% Answer to Question 6


end

function setAxisLabels()
xlabel('Wavelength [nm]');
ylabel('Relative Power');
end

% function to normalize a dataset
function normalizedDataset = normalizeDataset(dataset)
normalizedDataset = bsxfun(@rdivide,dataset,max(dataset));
end

% function for computing the camera sensitivities
function R = computeCameraSensitivity(sigma)

red     = exp(- ((400:10:700) - 650).^2/(2 * sigma^2));

green   = exp(- ((400:10:700) - 550).^2/(2 * sigma^2));

blue    = exp(- ((400:10:700) - 450).^2/(2 * sigma^2));

R = [red' green' blue'];

R = R/max(R(:));
end