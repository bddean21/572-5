% -------------------------------------------------------------------
%  Generated by MATLAB on 19-Sep-2022 22:31:57
%  MATLAB version: 9.11.0.1837725 (R2021b) Update 2
% -------------------------------------------------------------------
saveVarsMat = load('assignment5.mat');

bottom_y = 182.189708141321;

center_x = 95.123655913978524;

filtered = saveVarsMat.filtered; % <375x500x3 uint8> too many elements

im = saveVarsMat.im; % <375x500x3 uint8> too many elements

im_bg = saveVarsMat.im_bg; % <240x320x3 double> too many elements

im_obj = saveVarsMat.im_obj; % <800x800x3 double> too many elements

im_s = saveVarsMat.im_s; % <563x590x3 double> too many elements

mask_s = saveVarsMat.mask_s; % <563x590 double> too many elements

objmask = saveVarsMat.objmask; % <800x800 logical> too many elements

padding = 64;

poly_x = [190.38326848249022 134.35214007782093 145.2470817120622 641.74513618677042 ...
          668.2042801556421 191.93968871595325 227.73735408560307];

poly_y = [163.14591439688706 413.72957198443567 726.57003891050567 729.68287937743173 ...
          161.58949416342398 161.58949416342398 626.95914396887144];

result1 = saveVarsMat.result1; % <866x1300x3 double> too many elements

result2 = saveVarsMat.result2; % <563x590x3 double> too many elements

clear saveVarsMat;
