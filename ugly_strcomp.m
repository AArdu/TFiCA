function string = ugly_strcomp(cell1, cell2)
    if strcmp(char(cell1),'BlackHair')
        if (strcmp(char(cell2),'BrownHair')) || (strcmp(char(cell2),'BlondeHair')) || (strcmp(char(cell2),'RedHair')) || (strcmp(char(cell2),'GrayHair'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
            
    %if ((strcmp(char(cell1),'BlackHair')) && (strcmp(char(cell2),'BrownHair'))) || ((strcmp(char(cell1),'BlackHair')) && (strcmp(char(cell2),'BlondeHair'))) || ((strcmp(char(cell1),'BlackHair')) && (strcmp(char(cell2),'RedHair'))) || ((strcmp(char(cell1),'BlackHair')) && (strcmp(char(cell2),'GrayHair'))) 
        
        %if char(PastSelectedFeatures(1)) == 'BlackHair'
    disp('e')
    end
end