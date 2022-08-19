% SCRIPT: Main Program
clear; clc; close all;

% Define path to directory containing the test images
imagesDir = 'images/All/';


% Get information about the images in the specified directory
fileData = GetFileDataFromDirectory(imagesDir);

% Add file paths to a string array/
for i = 1:length (fileData)

    % Get file name and file path
    fileName = fileData(i).name;
    filePath = fullfile(imagesDir, fileName);

    %Set 'base0utput' to 'fileNlame'
    baseOutput = fprintf('&s: ', fileName);
    
    %Load image(Size: 288, 352; 3)
    
    image = imread (filePath);
    
    %Check if bottle is missing
    bottleMissing = CheckIfBottleMissing(image);

    if bottleMissing

        %Add 'bottle missing" to the output
        figure
        imshow (image)
        title ("Bottle missing")
        output = baseOutput + fprintf ('No Faults Detected (Bottle Missing) ');
    else
        output = baseOutput;

        % Check if the cap is missing
        bottleCapMissing = CheckIfBottleCapMissing(image);
    end

        if bottleCapMissing
                % Add 'bottle cap missing' to the output
                figure
                imshow(image)
                title ("Bottle Cap pissing")
                output = output + fprintf("Bottle Cap Missing,");
        end
    
        % Check if the bottle is underfilled
        bottleUnderfilled = CheckIfBottleUnderfilled(image);

        if bottleUnderfilled

            % Add "bottle underfilled' to the ourput
            figure
            imshow(image)
            title ("Bottle Underfilled")
            output =  output + fprintf ('Bottle Underfilled, ');
        end


        % Check if label is missing
         labelMissing = CheckIfLabelMissing(image);

        if labelMissing

            % Add "label missing' to the ourput
            figure
            imshow(image)
            title ("Label Missing")
            output =  output + fprintf ('Label Missing, ');
        else

            %check if the bottle is deformed
            bottleDeformed = CheckIfBottleDeformed(image);
        end

        bottleOverfilled = CheckIfBottleOverfilled(image);

        if bottleDeformed

            % Add "bottle Deformed' to the ourput
            figure
            imshow(image)
            title ('Bottle Deformed')
            output =  output + fprintf ('Bottle Deformed, ');
            %if bottle is deformed,  the bottle should not be detected as
            % overfilled
        end
        
        if bottleOverfilled
           figure
           imshow(image)
           title("Bottle Overfilled")
           output + output + fprintf('Bottle Overfilled, '); 
     
        end
    
        if output == baseOutput  
           figure
           imshow(image)
           title("No fault detected")
           output = output + fprintf('No Fault Detected');
        end
        
        fprintf('\n');
    end


