%% H-4

hist2_image = imread('C:\Users\pltra\OneDrive\Belgeler\hist2.bmp');
histeq_image = histeq(hist2_image);
adapthisteq_image = adapthisteq(hist2_image);

figure;
subplot(2, 2, 1); imshow(hist2_image);
title('Original hist2 Image');

subplot(2, 2, 2); imshow(histeq_image);
title('Image after Histogram Equalization (histeq)');

subplot(2, 2, 3); imshow(adapthisteq_image);
title('Image after Adaptive Histogram Equalization (adapthisteq)');


%% H-5

clearvars; close all; clc;

phobos_image = imread('C:\Users\pltra\OneDrive\Belgeler\phobos.bmp');

phobos_stretched = imadjust(phobos_image);
phobos_he = histeq(phobos_image);
phobos_clahe = adapthisteq(phobos_image);

load('C:\Users\pltra\OneDrive\Belgeler\MATLAB\desiredHistogram.mat');

phobos_matching = histeq(phobos_image, desiredHistogram);

figure;

subplot(2, 5, 1); imshow(phobos_image);
title('Original');

subplot(2, 5, 2); imshow(phobos_stretched);
title('after Stretching');

subplot(2, 5, 3); imshow(phobos_he);
title('HE');

subplot(2, 5, 4); imshow(phobos_clahe);
title('Adaptive Equalization');

subplot(2, 5, 5); imshow(phobos_matching);
title('H.Matching');

subplot(2, 5, 6); imhist(phobos_image);
title('Histogram');

subplot(2, 5, 7); imhist(phobos_stretched);
title('H.Stretching');

subplot(2, 5, 8); imhist(phobos_he);
title('H.HE');

subplot(2, 5, 9);  imhist(phobos_clahe);
title('H.Adaptive Equalization');

subplot(2, 5, 10); imhist(phobos_matching);
title('H.HM');

sgtitle('Comparison of Image Enhancement Methods');
%% H-6
clearvars; close all; clc;

lenaRGB = imread('C:\Users\pltra\OneDrive\Belgeler\lenaRGB.bmp');

R = lenaRGB(:,:,1);
G = lenaRGB(:,:,2);
B = lenaRGB(:,:,3);

R_equalized = histeq(R);
G_equalized = histeq(G);
B_equalized = histeq(B);

image_equalized_rgb = cat(3, R_equalized, G_equalized, B_equalized);

figure;
subplot(1, 2, 1); imshow(lenaRGB);
title('Original Color Image');

subplot(1, 2, 2); imshow(image_equalized_rgb);
title('Equalized (RGB Channels Separately)');

lenaHSV = rgb2hsv(lenaRGB);

V = lenaHSV(:,:,3);
V_equalized = histeq(V);
lenaHSV(:,:,3) = V_equalized;
image_equalized_hsv = hsv2rgb(lenaHSV);

figure;
subplot(1, 2, 1); imshow(lenaRGB);
title('Original Color Image');

subplot(1, 2, 2); imshow(image_equalized_hsv);
title('Equalized (Only V Component)');

