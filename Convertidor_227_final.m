% Specify the folder where the files live.
myFolder = uigetdir(); % Ask for new directory.
% Check to make sure that folder actually exists.  Warn user if it doesn't.
% if ~isfolder(myFolder)
%     errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', myFolder);
%     uiwait(warndlg(errorMessage));
%     myFolder = uigetdir(); % Ask for a new one.
%     if myFolder == 0
%          % User clicked Cancel
%          return;
%     end
% end
% Get a list of all files in the folder with the desired file name pattern.
a='*.jpg';
b='*.png';
c='*.jpeg';
d='*.bmp';
e='*.tiff';
f='other';
list = {a,b,c,...                   
d,e,'other'};
[indx,tf] = listdlg('PromptString',{'Select a file.',...
    'Only one file can be selected at a time.',''},'ListString',list);

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

list = {'Solo cambiar dimensiones','Convertir a color y dimensionar'};
[ind,tf] = listdlg('PromptString',{'Select a file.',...
    'Only one file can be selected at a time.',''},'ListString',list,'ListSize',[250,250]);

% list = {'227*227','Custom'};
% [ind1,tf] = listdlg('PromptString',{'Select a file.',...
%     'Only one file can be selected at a time.',''},'ListString',list);

% if ind1==1
%     largo=227;
%     alto=227;
% else
%     largo = inputdlg('Largo:',...
%              'Dimensiones', [1 20]);
%     alto = inputdlg('Alto:',...
%              'Dimensiones', [1 20]);
%     
% end

for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
%     % Now do whatever you want with this file name,
%     imageArray= imread(fullFileName);
%     res = grs2rgb(imageArray);
%     imwrite(res,fullFileName);

    if ind==1
     
% This section allow to crop the black border of the images
% if it is uncommented, just pick the same option for image resize
        
%         imageCOLOR= imread(fullFileName);
%         imageRGB = imageCOLOR;
%         imageArray = rgb2gray(imageRGB);
%         binaryImage = imbinarize(imageArray);
%         [rows, columns] = find(binaryImage);
%         topRow = min(rows);
%         bottomRow = max(rows);
%         leftColumn = min(columns);
%         rightColumn = max(columns);
%         croppedImage = imcrop(imageCOLOR,[leftColumn topRow (rightColumn-leftColumn) (bottomRow-topRow)]);
%         imwrite(croppedImage,fullFileName);
        
        
%         imageArray= imread(fullFileName);
%         [rows, columns, numberOfColorChannels] = size(imageArray);
%         left = columns/2 - 2300/2;
%         top = rows/2 - 2300/2;
%         croppedImage = imcrop(imageArray, [left, top, 2300, 2300]);
%         imwrite(croppedImage,fullFileName);

% This section allow to crop the black border of the images
% if it is uncommented, just pick the same option for image resize
        
         imageArray= imread(fullFileName);
      
         gamma= imresize(imageArray,[227 227]);
         imwrite(gamma,fullFileName);
           
    else
        imageArray= imread(fullFileName);
    res = grs2rgb(imageArray);
    delta= imresize(res,[227 227]);
    imwrite(delta,fullFileName);
    
    end
    
    
    
  
    % such as reading it in as an image array with imread()
    %imageArray = imread(fullFileName);
    %imshow(imageArray);  % Display image.
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
        
        %warndlg()
%     case 'No thank you'
%         disp('I''ll bring you your check.')
%         dessert = 0;
end
