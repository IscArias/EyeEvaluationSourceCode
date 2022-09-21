%Code by Isaac Arias S - YachayTech University
%Biomedical Engineer Student.
%School of Biological Sciences and Engineering.

%Convertidor_227_final.m allows the image pre-processing
clc
clear all
close all

% Select the specific database that contains the images to be pre-processed.

myFolder = uigetdir(); % Ask for new directory.

% Get a list of all files in the folder with the desired file name pattern.
a='*.jpg';
b='*.png';
c='*.jpeg';
d='*.bmp';
e='*.tiff';
f='other';
list = {a,b,c,...                   
d,e,'other'};
[indx,tf] = listdlg('PromptString',{'Image format - Database.',...
    'Only one file can be selected.',''},...
    'SelectionMode','single','ListString',list,'ListSize',[160,200]);

if indx==6
    answer = inputdlg('Formato= *.etc','formato a buscar', [1 20]);
    beta=char(answer);
    filePattern = fullfile(myFolder,beta); % Change to whatever pattern you need.
    theFiles = dir(filePattern);
else
    alfa=char(list(indx));
    filePattern = fullfile(myFolder, alfa); % Change to whatever pattern you need.
    theFiles = dir(filePattern);
end

list = {'Resize to 227x227px','Add red filter - grayscale image',...
    "Cropping black areas - Images"};
[ind,tf] = listdlg('PromptString',{'Select a function.',...
    'Only one option can be selected at a time.',''},...
    'SelectionMode','single','ListString',list,'ListSize',[250,150]);


for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);

% This section allow to resize the images
    if ind==1    
        imageArray= imread(fullFileName);
        gamma= imresize(imageArray,[227 227]);
        imwrite(gamma,fullFileName);

% This section allow to add red filter color
% Grayscale to RGB Converter by Valeriy Korostyshevskiy
    elseif ind==2
        imageArray= imread(fullFileName);
        delta = grs2rgb(imageArray);
        imwrite(delta,fullFileName);

% This section allow to crop the black border of the images
    else
        imageCOLOR= imread(fullFileName);
        imageRGB = imageCOLOR;
        imageArray = rgb2gray(imageRGB);
        binaryImage = imbinarize(imageArray);
        [rows, columns] = find(binaryImage);
        topRow = min(rows);
        bottomRow = max(rows);
        leftColumn = min(columns);
        rightColumn = max(columns);
        croppedImage = imcrop(imageCOLOR,[leftColumn topRow (rightColumn-leftColumn) (bottomRow-topRow)]);
        imwrite(croppedImage,fullFileName);
    end
    drawnow; % Force display to update immediately.
end

answer = questdlg('Abrir la carpeta de imagenes?', ...
	'Img', ...
	'Yes','No','No');
% Handle response
switch answer
    case 'Yes'
        
        
        winopen(myFolder);
    case 'No'
        disp([answer ' bye.'])
end
