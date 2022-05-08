
clc;close all;clear all;
load netTransfer3; % Database se puede reemplazar por cualquier modelo entrenado
sample_image_folder = fullfile('C:\Users\acer.LAPTOP-5D7SPG9D\Desktop\Isaac\YachayTech\8vo Semestre\SIGNAL THEORY\Paper\Base de Datos - Imagenes\BinRushed');  
[filename,user_canceled] = imgetfile('InitialPath',sample_image_folder);% pide abrir una imagen por ventana y la almacena
es = imread(filename);%abre la imagen que esta en el mismo directorio del codigo actual. O se puede especificar la dirrecion del fichero
es=imresize(es,[227 227]);% cambia el tamaño de la imagen
[label,scores]=classify(netTransfer3,es);% compara y clasifica la imagen con la base de datos entrenada
classNames = netTransfer3.Layers(end).ClassNames;
imshow(es)

title("\color{red}  "+ (string(label)) +" \color{black}Porcentaje de predicción "...
    +num2str(100*scores(classNames == label),3)+ "%");