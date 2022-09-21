close('all');   % close all open figures so we start with a clean slate!

im_bg = im2double(imread('https://raw.githubusercontent.com/bddean21/572-5/main/swimtest.jpg'));        % background image
im_obj = im2double(imread('https://raw.githubusercontent.com/bddean21/572-5/main/polartest.jpg'));       % source image

% Get source region mask (extracted object) from the user
% First draw a polygon on the source image for applying the mask

 %[poly_x, poly_y] = getPolygonForMask(im_obj);

% NOTE: For your own image sets, simply uncomment the call to getPolygonForMask(), and
% DO NOT USE the hard-coded polygon coordinates below!
poly_x = [276.4628  324.9961  391.5884  425.4488  453.6659  457.0519  433.3496 442.3791 ...
    441.2504  348.6984  248.2457  222.2860  238.0876  226.8008  222.2860  214.3853  224.5434  248.2457];
poly_y = [255.3512  238.4209  255.3512  250.8364  260.9946  283.5682  329.8442  349.0318 ...
    404.3372  419.0101  404.3372  356.9326  342.2597  308.3992  292.5977  265.5093  250.8364  247.4504];

% Convert polygon to a binary mask
objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));

% Next, align the source object (im_s) and mask (mask_s) with the background image.  
% Get the bottom center location on the target image by using the function
% getBottomCenterLoc interactively

 %[center_x, bottom_y] = getBottomCenterLoc(im_bg)

% NOTE: For your own image sets, simply uncomment the call to getBottomCenterLoc(), and
% DO NOT USE the hard-coded alignment coordinates below!
center_x = 575.9264;
bottom_y = 432.4922;

% Translate both the source image and the object mask for proper alignment
% w.r.t. the background image
% Pad the extracted object by 64 pixels each side to allow for feathering/blending overlap.

padding = 64;
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);  % convert mask from binary to double

% Call the function to blend the images using the mask
result1 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result1});


%%
% -------------------------------------------------------------------------
% IMPORTANT NOTE (please read carefully)
% -------------------------------------------------------------------------
% Repeat your method for 4 more sets of images.  But remember that for
% these you must interactively specify the mask and alignment ONE TIME.
%
% The Matlab Grader website does not allow interactive code.  Therefore,
% you must first develop and run your code either in the Matlab computer
% app, or in the full Matlab Online version (https://matlab.mathworks.com).
% Both of those version allow interactive code, which will allow you to
% specify a mask for object selection and an alignment point in the
% target/background image.
%
% Once you are satisfied with your choice of mask and alignment, copy the
% values of the poly_x and poly_y vectors (which define the vertices of the
% polygon mask), and the values of center_x and bottom_y (which specify the
% alignment) from the output of the Command Window.  Then, hard-code these
% values into your code below, just like it was done for the first image
% set above.
%
% There are two reasons for hard-coding these values.  First, it avoids the
% need to repeatedly interact with the tool to specify the mask and
% alignment while you are fine tuning the blending algorithm.  Second, you
% will be submitting your final work on the Matlab Grader website which
% does not allow interactive code.
%
% -------------------------------------------------------------------------


%%%%% your own images
im_bg = im2double(imread('https://raw.githubusercontent.com/bddean21/572-5/main/grapefruit.jpg'));        % background image
im_obj = im2double(imread('https://raw.githubusercontent.com/bddean21/572-5/main/toe.jpg'));       % source image

% % Get source region mask (extracted object) from the user
% %  First draw a polygon on the source image for applying the mask


[poly_x, poly_y] = getPolygonForMask(im_obj)
disp("tomato and grapefruit");
%disp("Copy the values of the vectors poly_x and poly_y from the " + ...
    %"Command Window below and hard code them inside your code for " + ...
    %"submission via the Grader website.");
%poly_x =   [316.0253  285.0681  302.9280  275.5428  244.5856  171.9553  150.5233  231.4883  133.8541  106.4689   86.2276 111.2315   54.0798   55.2704   75.5117  110.0409  148.1420  205.2938  318.4066]     % display x coords of polygon
%poly_y = [588.0914  138.0214   78.4883   63.0097  109.4455   36.8152   53.4844  152.3093  159.4533  134.4494  124.9241   184.4572  245.1809  371.3911  478.5506  520.2237  538.0837  573.8035  590.4728]       % display y coords of polygon
% Once you have these coordinates, comment out the call to getPolygonForMask() 
% and hard code the coordinates instead.

objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));
 
% % Get the bottom center location on the target image by using the function
% % getBottomCenterLoc interactively

%center_x = 150.9163;
%bottom_y = 498.3278;
[center_x, bottom_y] = getBottomCenterLoc(im_bg)
%disp("Copy the values of center_x and bottom_y from the " + ...
    %"Command Window below and hard code them inside your code for " + ...
    %"submission via the Grader website.");
%center_x        % display x coord where center of object should be placed
%bottom_y        % display y coord where bottom of object should be placed
% Once you have these coordinates, comment out the call to getBottomCenterLoc()
% and hard code the coordinates instead.

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
result2 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result2});


% REPEAT ABOVE FOR IMAGE SET 3

%%%%% your own images
im_bg = im2double(imread('https://raw.githubusercontent.com/bddean21/572-5/main/rockbod.jpeg'));        % background image
im_obj = im2double(imread('https://raw.githubusercontent.com/bddean21/572-5/main/rockeye.jpg'));       % source image

% % Get source region mask (extracted object) from the user
% %  First draw a polygon on the source image for applying the mask


[poly_x, poly_y] = getPolygonForMask(im_obj)
disp("rock");
%disp("Copy the values of the vectors poly_x and poly_y from the " + ...
    %"Command Window below and hard code them inside your code for " + ...
    %"submission via the Grader website.");
%poly_x =   [1.0e+03 * 0.9865    1.0573    1.1781    1.1840    1.1221    1.0190    0.9954]     % display x coords of polygon
%poly_y = [  408.8241  355.7642  402.9286  470.7273  509.0484  482.5184  417.6674]       % display y coords of polygon
% Once you have these coordinates, comment out the call to getPolygonForMask() 
% and hard code the coordinates instead.

%objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));
 
% % Get the bottom center location on the target image by using the function
% % getBottomCenterLoc interactively

%center_x = 415.1304;
%bottom_y = 455.2860;
[center_x, bottom_y] = getBottomCenterLoc(im_bg)
%disp("Copy the values of center_x and bottom_y from the " + ...
    %"Command Window below and hard code them inside your code for " + ...
    %"submission via the Grader website.");
%center_x        % display x coord where center of object should be placed
%bottom_y        % display y coord where bottom of object should be placed
% Once you have these coordinates, comment out the call to getBottomCenterLoc()
% and hard code the coordinates instead.

%padding = 64;   % You may want to play with this parameter
%[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
%mask_s = im2double(mask_s);

% % Apply your blending method
%result2 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
%figure; montage({im_bg, im_obj, mask_s, result2});
% REPEAT ABOVE FOR IMAGE SET 4
%%%%% your own images
im_bg = im2double(imread('https://raw.githubusercontent.com/bddean21/572-5/main/lol.jpg'));        % background image
im_obj = im2double(imread('https://raw.githubusercontent.com/bddean21/572-5/main/dump.jpg'));       % source image

% % Get source region mask (extracted object) from the user
% %  First draw a polygon on the source image for applying the mask


[poly_x, poly_y] = getPolygonForMask(im_obj)
disp("car on stairs");
%disp("Copy the values of the vectors poly_x and poly_y from the " + ...
    %"Command Window below and hard code them inside your code for " + ...
    %"submission via the Grader website.");
%poly_x =   [188.8268  668.2043  677.5428  680.6556  160.8113  135.9086  111.0058  118.7879  160.8113  149.9163  134.3521 171.7062  135.9086  190.3833]     % display x coords of polygon
%poly_y = [   175.5973  166.2588  113.3405  751.4728  743.6907  639.4105  639.4105  549.1381  547.5817  443.3016  443.3016   279.8774  214.5078  180.2665]       % display y coords of polygon
% Once you have these coordinates, comment out the call to getPolygonForMask() 
% and hard code the coordinates instead.

objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));
 
% % Get the bottom center location on the target image by using the function
% % getBottomCenterLoc interactively

%center_x = 102.9885;
%bottom_y = 173.8333;
[center_x, bottom_y] = getBottomCenterLoc(im_bg)
%disp("Copy the values of center_x and bottom_y from the " + ...
    %"Command Window below and hard code them inside your code for " + ...
    %"submission via the Grader website.");
%center_x        % display x coord where center of object should be placed
%bottom_y        % display y coord where bottom of object should be placed
% Once you have these coordinates, comment out the call to getBottomCenterLoc()
% and hard code the coordinates instead.

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
result2 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result2});
  
% REPEAT ABOVE FOR IMAGE SET 5
%%%%% your own images
im_bg = im2double(imread('https://raw.githubusercontent.com/bddean21/572-5/main/carowinds.jpeg'));        % background image
im_obj = im2double(imread('https://raw.githubusercontent.com/bddean21/572-5/main/art.jpg'));       % source image

% % Get source region mask (extracted object) from the user
% %  First draw a polygon on the source image for applying the mask


[poly_x, poly_y] = getPolygonForMask(im_obj)
disp("theme park")
%disp("Copy the values of the vectors poly_x and poly_y from the " + ...
    %"Command Window below and hard code them inside your code for " + ...
    %"submission via the Grader website.");
%poly_x =   [1.0e+03 * 0.9865    1.0573    1.1781    1.1840    1.1221    1.0190    0.9954]     % display x coords of polygon
%poly_y = [  408.8241  355.7642  402.9286  470.7273  509.0484  482.5184  417.6674]       % display y coords of polygon
% Once you have these coordinates, comment out the call to getPolygonForMask() 
% and hard code the coordinates instead.

objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));
 
% % Get the bottom center location on the target image by using the function
% % getBottomCenterLoc interactively

%center_x = 415.1304;
%bottom_y = 455.2860;
[center_x, bottom_y] = getBottomCenterLoc(im_bg)
%disp("Copy the values of center_x and bottom_y from the " + ...
    %"Command Window below and hard code them inside your code for " + ...
    %"submission via the Grader website.");
%center_x        % display x coord where center of object should be placed
%bottom_y        % display y coord where bottom of object should be placed
% Once you have these coordinates, comment out the call to getBottomCenterLoc()
% and hard code the coordinates instead.

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
result2 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result2});


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is your function that implements the blending method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function im_cut_and_paste = cut_and_paste(im_bg, im_s, mask_s)
    im_r = im_s(:,:,1);
    im_g = im_s(:,:,2);
    im_b = im_s(:,:,3);
    im_r(mask_s == 0) = 0;
    im_g(mask_s == 0) = 0;
    im_b(mask_s == 0) = 0;
    im_inter = im_s;
    im_inter(:,:,1) = im_r;
    im_inter(:,:,2) = im_g;
    im_inter(:,:,3) = im_b;
    im_r = im_bg(:,:,1);
    im_g = im_bg(:,:,2);
    im_b = im_bg(:,:,3);
    im_r(mask_s == 1) = 0;
    im_g(mask_s == 1) = 0;
    im_b(mask_s == 1) = 0;
    im_bg(:,:,1) = im_r;
    im_bg(:,:,2) = im_g;
    im_bg(:,:,3) = im_b;
    im_cut_and_paste = im_inter + im_bg;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Below are helper functions.  You DO NOT NEED TO MODIFY
% any of the code below.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [poly_x, poly_y] = getPolygonForMask(im)
    % Asks user to draw polygon around input image.  
    disp('Draw polygon around source object in clockwise order, q to stop');
    fig=figure; hold off; imagesc(im); axis image;
    poly_x = [];
    poly_y = [];
    while 1
        figure(fig)
        [x, y, b] = ginput(1);
        if b=='q'
            break;
        end
        poly_x(end+1) = x;
        poly_y(end+1) = y;
        hold on; plot(poly_x, poly_y, '*-');
    end
    close(fig);
end


function [center_x, bottom_y] = getBottomCenterLoc(im_t)
    disp('choose target bottom-center location');
    fig=figure; hold off; imagesc(im_t); axis image;
    figure(fig)
    [center_x, bottom_y, ~] = ginput(1);
    close(fig);
end


function [im_s2, mask2] = alignSource(im_s, mask, im_t, center_x, bottom_y, padding)
    % Inputs:  source image, mask, target/background image, ...
    % center_x, bottom_y are the coordinates of the bottom center location on the target image
    % padding is the number of extra rows/coumns to include around the
    % object to allow for feathering/blending.

    % Outputs: an aligned source image and also an aligned blending mask.
    
    % find the bounding box of the mask, and enlarge it by the amount of
    % padding
    [y, x] = find(mask);
    y1 = min(y)-1-padding; y2 = max(y)+1+padding; 
    x1 = min(x)-1-padding; x2 = max(x)+1+padding;
    im_s2 = zeros(size(im_t));

    yind = (y1:y2);
    yind2 = yind - max(y) + round(bottom_y);
    xind = (x1:x2);
    xind2 = xind - round(mean(x)) + round(center_x);
    
    % if the padding exceeds the image boundaries,
    % clip to image boundary
    yind(yind > size(im_s, 1)) = size(im_s, 1);
    yind(yind < 1) = 1;
    xind(xind > size(im_s, 2)) = size(im_s, 2);
    xind(xind < 1) = 1;
   
    yind2(yind2 > size(im_t, 1)) = size(im_t, 1);
    yind2(yind2 < 1) = 1;
    xind2(xind2 > size(im_t, 2)) = size(im_t, 2);
    xind2(xind2 < 1) = 1;

    y = y - max(y) + round(bottom_y);
    x = x - round(mean(x)) + round(center_x);
    ind = y + (x-1)*size(im_t, 1);
    mask2 = false(size(im_t, 1), size(im_t, 2));
    mask2(ind) = true;
    
    im_s2(yind2, xind2, :) = im_s(yind, xind, :);    
end
