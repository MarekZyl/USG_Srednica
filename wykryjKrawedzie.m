function BW = wykryjKrawedzie (varargin)
I = varargin{1};
%filtracja gausowska
Iblur = imgaussfilt(I, 5);
%wykrycie krawedzi
BW1 = edge(Iblur,'Canny');
%dylatacja w oparciu o pozioma linie
se1 = strel('line',3,0);
BW = imdilate(BW1,se1);
%na zyczenie rysunek
if (nargin > 1)
    if (varargin{2} == true)
        figure();
        subplot(1,2,1)
        imshow(Iblur);
        subplot(1,2,2)
        imshow(BW);
    end
end