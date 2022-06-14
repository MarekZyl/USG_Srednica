function pozycje = wskazPunkty (varargin)
for i = 1:(nargin/2)
    if (strcmp(varargin{i*2-1},'Figure'))
        figura = varargin{i*2};
    end
    if (strcmp(varargin{i*2-1},'Tekst'))
        tekst = varargin{i*2};
    end
end

if (exist('figura','var'))
    dcm_obj = datacursormode(figura);
else
    dcm_obj = datacursormode();
end

set(dcm_obj,'DisplayStyle','window','Enable','off')
set(dcm_obj,'DisplayStyle','datatip',...
'SnapToDataVertex','off','Enable','on')
set(dcm_obj,'UpdateFcn',@myupdatefcn)

if (exist('tekst','var'))
    disp(tekst)
    title (tekst)
    pause
end


c_info = getCursorInfo(dcm_obj);

pozycje(length(c_info),2) = 0;
for i=1:length(c_info)
    pozycje(i,:) = c_info(i).Position;
end

function txt = myupdatefcn(~,~)
% Customizes text of data tips
txt = {[]};