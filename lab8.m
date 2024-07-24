I = imread('coins.png');
imshow(I);
title('Original image');

figure;
h = imhist(I);
bar(h);
title('Histogram of the image');
xlabel('Intensity');
ylabel('Frequency');
axis([0 255 0 10000]);
zoom on;

T = 198/255; % it can change this value

BW = imbinarize(I,T);

figure;
imshow(BW);
title(['Binary image with threshold = ' num2str(T)]);
%%
I1 = imread('C:\Users\pltra\OneDrive\Belgeler\shape1.png');
I2 = imread('C:\Users\pltra\OneDrive\Belgeler\shape2.png');
I3 = imread('C:\Users\pltra\OneDrive\Belgeler\shape3.png');

h1 = imhist(I1);
h2 = imhist(I2);
h3 = imhist(I3);

T1 = 100/255; 
T2 = 145/255; 
T3 = 150/255; 

BW1 = imbinarize(I1,T1);
BW2 = imbinarize(I2,T2);
BW3 = imbinarize(I3,T3);

figure;
subplot(3,3,1);
imshow(I1);
title('Original image 1');
subplot(3,3,2);
bar(h1);
title('Histogram of image 1');
xlabel('Intensity');
ylabel('Frequency');
axis([0 255 0 10000]);
subplot(3,3,3);
imshow(BW1);
title(['Binary image 1 with threshold = ' num2str(T1)]);

subplot(3,3,4);
imshow(I2);
title('Original image 2');
subplot(3,3,5);
bar(h2);
title('Histogram of image 2');
xlabel('Intensity');
ylabel('Frequency');
axis([0 255 0 10000]);
subplot(3,3,6);
imshow(BW2);
title(['Binary image 2 with threshold = ' num2str(T2)]);

subplot(3,3,7);
imshow(I3);
title('Original image 3');
subplot(3,3,8);
bar(h3);
title('Histogram of image 3');
xlabel('Intensity');
ylabel('Frequency');
axis([0 255 0 10000]);
subplot(3,3,9);
imshow(BW3);
title(['Binary image 3 with threshold = ' num2str(T3)]);

%% part2



I = imread('coins.png');

I = rgb2gray(I);

I = im2uint8(I);

T = clusterKittler(I);

BW = imbinarize(I,T/255);

imshow(BW);
title(['Kittler binarization with threshold = ' num2str(T)]);

%%



%%
close all;
clearvars;
clc;

% Load image
originalImage = imread('C:\Users\pltra\OneDrive\Belgeler\coins_grad.png');

% Display the original image and its histogram
figure;
subplot(2, 3, 1);
imshow(originalImage);
title('Original Image');

subplot(2, 3, 4);
imhist(originalImage);
title('Original Image Histogram');

% Manually determine the threshold for coins_grad.png (adjust this based on your observation)
manualThreshold = 0.5; % Example threshold, adjust as needed
subplot(2, 3, 2);
binaryImageManual = imbinarize(originalImage, manualThreshold);
imshow(binaryImageManual);
title('Binary Image (Manual)');

% Apply Otsu's method
otsuThreshold = graythresh(originalImage);
binaryImageOtsu = imbinarize(originalImage, otsuThreshold);
subplot(2, 3, 3);
imshow(binaryImageOtsu);
title('Binary Image (Otsu)');

% Apply Kittler's method
kittlerThreshold = clusterKittler(originalImage(:));
binaryImageKittler = imbinarize(originalImage, kittlerThreshold);
subplot(2, 3, 5);
imshow(binaryImageKittler);
title('Binary Image (Kittler)');

% Apply Yen's method
yenThreshold = entropyYen(originalImage);
binaryImageYen = imbinarize(originalImage, yenThreshold);
subplot(2, 3, 6);
imshow(binaryImageYen);
title('Binary Image (Yen)');

% Adaptive threshold using adaptthresh
adaptiveThreshold = adaptthresh(originalImage, 'NeighborhoodSize', [25 25], 'Statistic', 'mean');
adaptiveBinaryImage = imbinarize(originalImage, adaptiveThreshold);
figure;
subplot(2, 2, 1);
imshow(originalImage);
title('Original Image');

subplot(2, 2, 2);
imshow(adaptiveBinaryImage);
title('Adaptive Binary Image');

% Use morphological operations to correct the image
filledImage = imfill(adaptiveBinaryImage, 'holes');
openedImage = imopen(filledImage, strel('disk', 5));

subplot(2, 2, 3);
imshow(filledImage);
title('Filled Image');

subplot(2, 2, 4);
imshow(openedImage);
title('Opened Image');
%%

close all;
clearvars;
clc;

% Load image
I = imread('C:\Users\pltra\OneDrive\Belgeler\bart.bmp');

% Display the original image and its histogram
figure;
subplot(2, 3, 1);
imshow(I);
title('Original Image');

subplot(2, 3, 4);
imhist(I);
title('Original Image Histogram');

% Convert to grayscale
I = im2gray(I);

% Binarization using two thresholds
lowerThreshold = 120;  % Adjust as needed
upperThreshold = 180;  % Adjust as needed
binaryImage = (I > lowerThreshold) & (I < upperThreshold);

% Display the binarized image
subplot(2, 3, 5);
imshow(binaryImage);
title('Binarized Image');

% Display histogram for the binarized image
subplot(2, 3, 6);
imhist(binaryImage);
title('Binarized Image Histogram');

% Function Definitions
function displayBinarizationComparison(originalImage, binarizedImage, titleText)
    figure;
    
    subplot(2, 2, 1);
    imshow(originalImage);
    title('Original Image');

    subplot(2, 2, 2);
    imshow(binarizedImage);
    title(titleText);
end




