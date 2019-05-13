% Segmentacja - Systemy Wizyjne
% Maciej Aleksandrowicz, 08.05.2018

close all;
clear all;


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Załadowanie obrazu oraz jego wyswietlenie i pobranie punktu startowego

obraz = imread('knee','png');
figure(1);
imshow(obraz);
[punkt(2), punkt(1)] = ginput(1);
punkt(1) = uint16(punkt(1));
punkt(2) = uint16(punkt(2));

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Przygotowanie macierzy i stosu
obraz           = double(obraz);
obrazVISITED    = boolean(zeros(size(obraz)));
obrazSEGMENTED  = zeros(size(obraz));
STOS            = zeros(2000,2);
STOSptr         = 0;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Odlożenie punktu startowego na stos
STOS(1,1) = punkt(1);
STOS(1,2) = punkt(2);
STOSptr   = 1;
obrazVISITED(punkt(1), punkt(2))     = 1;
obrazSEGMENTED(punkt(1), punkt(2))   = 1;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Zmienne dla obliczania sredniej kroczacej
srednia     = obraz(punkt(1), punkt(2));
srednia_n   = 0;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Rozpoczecie petli algorytmu

iteracje=1;
figure(2);
while(STOSptr >0)
    if( mod(iteracje,1000) == 0)
        imshow(obrazSEGMENTED.*obraz);
        drawnow;
    end
    
    %Rozpatrywany punkt
    punkt(1) = STOS(STOSptr,1);
    punkt(2) = STOS(STOSptr,2);
    STOSptr = STOSptr - 1;
    
    %Czy nie jest na krawedzi
    if( ~(punkt(1) == 1 || punkt(2) == 1 || punkt(1) == size(obraz,1) || punkt(2) == size(obraz,2)) )  
        %Obliczenie sredniej kroczacej dla tego kroku
        if(srednia_n ~= 0) %Pomijamy punkt startowy
            srednia = (srednia * (srednia_n-1) + obraz(punkt(1),punkt(2))) / srednia_n;
        end
        srednia_n = srednia_n + 1;
        
        % Sprawdzenie otoczenia punktu
        for(i=-1:1:1)
            for(j=-1:1:1)
                if(obrazVISITED(punkt(1)+i, punkt(2)+j) == 0)
                    %Wykrycie progu modulu roznicy jasnosci
                    if( abs( obraz(punkt(1)+i,punkt(2)+j) - srednia) < 60)
                        STOSptr = STOSptr + 1;
                        STOS(STOSptr,1) = punkt(1)+i;
                        STOS(STOSptr,2) = punkt(2)+j;
                        obrazSEGMENTED(punkt(1)+i, punkt(2)+j) = 1;
                    end
                    obrazVISITED(punkt(1)+i, punkt(2)+j) = 1;
                end %IF
            end %FOR j
        end %FOR i
    else
        obrazVISITED(punkt(1), punkt(2)) = 1;
    end %IF
    
    iteracje = iteracje + 1;
end %WHILE
drawnow;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Wyswietlenie obrazu segmentowowanego

figure(3);
imshow(obrazSEGMENTED,[]);