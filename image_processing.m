clear all 

iml = imread('images/All/image001.jpg')

%Get image size
imsize = size (iml)

%Shox image
imshow (iml);

%Convert rgb to grayscale
grIml = rgb2gray (iml);

%Display as another image in a new figure
figure (2), imshow (grIml);
gray_size = size(grIml);

%Rotate image
rotated_image = imrotate(iml,45);
figure(3), imshow(rotated_image);

%Close and show as subplots

%Translated image
translated_image = imtranslate (iml, [30, 40]);
figure(4), imshow(translated)