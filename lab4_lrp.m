%% part1
clearvars; close all; clc;

board = imread('C:\Users\pltra\OneDrive\Belgeler\board.png');

filter_3x3 = fspecial('average', [3, 3]);
filtered_image_3x3 = uint8(filter2(filter_3x3, board, 'same'));
abs_diff_3x3 = imabsdiff(board, filtered_image_3x3);

figure(1);
subplot(131); imshow(board);
title('Original image board.png');

subplot(132); imshow(filtered_image_3x3);
title('Averaging filter 3x3');

subplot(133); imshow(abs_diff_3x3, []);
title('Absolute difference');


filter_35x35 = fspecial('average', [35, 35]);
filtered_image_35x35 = uint8(filter2(filter_35x35, board, 'same'));
abs_diff_35x35 = imabsdiff(board, filtered_image_35x35);

figure(2); 
subplot(131); imshow(board);
title('Original image board.png');


subplot(132); imshow(filtered_image_35x35);
title('Averaging filter 35x35');

subplot(133); imshow(abs_diff_35x35, []);
title('Absolute difference for 35x35 filter');

%task 1b
M = [1, 2, 1; 2, 4, 2; 1, 2, 1];
M = M / sum(M(:)); 

filtered_image_custom = uint8(filter2(M, board, 'same'));
abs_diff_custom = imabsdiff(board, filtered_image_custom);


figure(3); 
subplot(131); imshow(board);
title('Original image board.png');

subplot(132); imshow(filtered_image_custom);
title('Filtered using own mask');

subplot(133); imshow(abs_diff_custom, []);
title('Absolute difference for custom filter');

%task 1c
gaussian_filter_1 = fspecial('gaussian', [15, 15], 3);
gaussian_filter_2 = fspecial('gaussian', [30, 30], 6);

figure(4); 
subplot(121); mesh(gaussian_filter_1);
title('Kernel with std=3 (mesh)');

subplot(122); mesh(gaussian_filter_2);
title('Kernel with std=6 (mesh)');

filtered_image_std3 = imgaussfilt(board, 3);
filtered_image_std6 = imgaussfilt(board, 6);

figure(5);
subplot(131); imshow(board);
title('Original image board.bmp');

subplot(132); imshow(filtered_image_std3);
title('Filtrated for std=3');

subplot(133); imshow(filtered_image_std6);
title('Filtrated for std=6');
%% part 2
clearvars; close all; clc;

originalImage = imread('C:\Users\pltra\OneDrive\Belgeler\squares.bmp');

if size(originalImage, 3) > 1
    originalImage = rgb2gray(originalImage);
end

sobelHorizontal = fspecial('Sobel');
sobelVertical = sobelHorizontal';

sobelHorizontalResult = imfilter(originalImage, sobelHorizontal);
sobelVerticalResult = imfilter(originalImage, sobelVertical);

sobelHorizontalResult = double(sobelHorizontalResult);
sobelVerticalResult = double(sobelVerticalResult);

combinedFilterResult = sqrt(sobelHorizontalResult.^2 + sobelVerticalResult.^2);

combinedFilterResult = uint8((combinedFilterResult / max(combinedFilterResult(:))) * 255);

figure;

subplot(2, 2, 1); imshow(originalImage);
title('Original image squares.bmp');

subplot(2, 2, 2); imshow(sobelHorizontalResult, []);
title('Result of Sobel horizontal');

subplot(2, 2, 3); imshow(sobelVerticalResult, []);
title('Result of Sobel vertical');

subplot(2, 2, 4); imshow(combinedFilterResult, []);
title('Result of combined filter');

originalImage = imread('C:\Users\pltra\OneDrive\Belgeler\moon.png');

if size(originalImage, 3) > 1
    originalImage = rgb2gray(originalImage);
end

sobelHorizontalResult = imfilter(originalImage, sobelHorizontal);
sobelVerticalResult = imfilter(originalImage, sobelVertical);
sobelHorizontalResult = double(sobelHorizontalResult);
sobelVerticalResult = double(sobelVerticalResult);
combinedFilterResult = sqrt(sobelHorizontalResult.^2 + sobelVerticalResult.^2);
combinedFilterResult = uint8((combinedFilterResult / max(combinedFilterResult(:))) * 255);

figure;

subplot(2, 2, 1); imshow(originalImage);
title('Original image moon.png');

subplot(2, 2, 2); imshow(sobelHorizontalResult, []);
title('Result of Sobel horizontal');

subplot(2, 2, 3); imshow(sobelVerticalResult, []);
title('Result of Sobel vertical');

subplot(2, 2, 4); imshow(combinedFilterResult, []);
title('Result of combined filter');
%% part 3

clearvars; close all; clc;

originalImage = imread('C:\Users\pltra\OneDrive\Belgeler\moon.png');

edgesDefault = edge(originalImage, 'canny');

sigma = 40.0; 
edgesSigma = edge(originalImage, 'canny', [], sigma);

threshold = 0.4;
edgesThreshold = edge(originalImage, 'canny', threshold);

figure;
subplot(2, 2, 1); imshow(originalImage);
title('Fig. 1: Original Image moon.png');

subplot(2, 2, 2); imshow(edgesDefault);
title('Fig. 2: Edges - Default Parameters');

subplot(2, 2, 3); imshow(edgesSigma);
title(['Fig. 3: Edges - Sigma = ' num2str(sigma)]);

subplot(2, 2, 4); imshow(edgesThreshold);
title(['Fig. 4: Edges - Threshold = ' num2str(threshold)]);
%% part 4
clearvars; close all; clc;

originalImage = imread('C:\Users\pltra\OneDrive\Belgeler\moon.png');

M = [0 1 0; 1 -4 1; 0 1 0];

laplacianOutput = filter2(M, double(originalImage), 'same');

laplacianAbs = abs(laplacianOutput);
maxValue = max(laplacianAbs(:));
laplacianNormalized = uint8((laplacianAbs / maxValue) * 255);

figure;
subplot(1, 2, 1); imshow(originalImage);
title('Image moon.png');

subplot(1, 2, 2);imshow(laplacianNormalized, []);
title('Laplacian Filtering');

%% part 5

%A = [0 0 0; 200 200 200; 100 100 100];
A = [0 0 0 200 200 200 100 100 100; 0 0 0 200 200 200 100 100 100; 0 0 0 200 200 200 100 100 100];
Fv = [1 0 -1; 2 0 -2; 1 0 -1];
Fh = Fv';

output_vertical = filter2(Fv, A, 'valid');
output_horizontal = filter2(Fh, A, 'valid');
combined_output = sqrt(output_vertical.^2 + output_horizontal.^2); 

output_vertical 
output_horizontal 
combined_output 

%%


A = [0 0 0 200 200 200 100 100 100; 
     0 0 0 200 200 200 100 100 100; 
     0 0 0 200 200 200 100 100 100];

Fv = [1 0 -1; 2 0 -2; 1 0 -1];
Fh = Fv';

output_v = filter2(Fv, A, 'valid');
output_h = filter2(Fh, A, 'valid');

disp(output_v);
disp(output_h);
