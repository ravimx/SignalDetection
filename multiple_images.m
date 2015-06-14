 image_folder = 'C:\Users\Dell\Documents\MATLAB\Signal detection\data\'; %  Enter name of folder from which you want to upload pictures with full path

filenames = dir(fullfile(image_folder, '*.png'));  % read all images with specified extention, its jpg in our case
 total_images = numel(filenames);    % count total number of photos present in that folder

 for n = 1:total_images
  full_name= fullfile(image_folder, filenames(n).name);         % it will specify images names with full path and extension
our_images = imread(full_name);                 % Read images  
   figure (n)                           % used tat index n so old figures are not over written by new new figures
    imshow(our_images)                  % Show all images
 end