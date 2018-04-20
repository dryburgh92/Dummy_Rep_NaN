%% Dummy_Rep_NaN (Elizabeth Dryburgh)
% For vectors with NaNs but you know mean, std, min and max range. Fill nusisance NaNs for vectors and fix vals <
% min(x) and > min(x)using a dummy vector

%Modify as you please...

% Call function (command or new script) & put in same path
% Dummy_Rep_NaN(x)

%%
function [x_new] = Dummy_Rep_NaN(x)

x_men = nanmean(x); %ignore NaN values 
x_sti = nanstd(x);  %ignore NaN values 
x_min = min(x);
x_max = max(x); 
sz = size(x);
num_runs = 100;
dummy = normrnd(x_men, x_sti,[sz]); %Vector same mean, STD

%% Replace vals that > x_min and < x_max 
% Stops undesriable elements without x range
for i =  1: (num_runs - 1)
    sub_vals = (dummy < x_min) | (dummy > x_max); 
    dummy(sub_vals) = normrnd(x_men, x_sti, sum(sub_vals(:)), 1); 
end 
    
%% Replace NaN with dummy vals

x_nan = isnan(x); %Logical array of NaN == TRUE = 1

x(x_nan) = dummy(x_nan);%Replace NaN with dummy elements

x_new = x %Elements filled NaNs
end 