function string = ugly_strcomp(cell1, cell2)
    if strcmp(char(cell1),'BlackHair')
        if (strcmp(char(cell2),'BrownHair')) || (strcmp(char(cell2),'BlondeHair')) || (strcmp(char(cell2),'RedHair')) || (strcmp(char(cell2),'GrayHair'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
    elseif strcmp(char(cell1),'BrownHair')
        if (strcmp(char(cell2),'BlackHair')) || (strcmp(char(cell2),'BlondeHair')) || (strcmp(char(cell2),'RedHair')) || (strcmp(char(cell2),'GrayHair'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
    elseif strcmp(char(cell1),'BlondeHair')
        if (strcmp(char(cell2),'BlackHair')) || (strcmp(char(cell2),'BrownHair')) || (strcmp(char(cell2),'RedHair')) || (strcmp(char(cell2),'GrayHair'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
    elseif strcmp(char(cell1),'RedHair')
        if (strcmp(char(cell2),'BlackHair')) || (strcmp(char(cell2),'BrownHair')) || (strcmp(char(cell2),'BlondeHair')) || (strcmp(char(cell2),'GrayHair'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
    elseif strcmp(char(cell1),'GrayHair')
        if (strcmp(char(cell2),'BlackHair')) || (strcmp(char(cell2),'BrownHair')) || (strcmp(char(cell2),'RedHair')) || (strcmp(char(cell2),'BlondeHair'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
    elseif strcmp(char(cell1),'GrayHair')
        if (strcmp(char(cell2),'BlackHair')) || (strcmp(char(cell2),'BrownHair')) || (strcmp(char(cell2),'RedHair')) || (strcmp(char(cell2),'BlondeHair'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
    elseif strcmp(char(cell1),'ShortHair')
        if (strcmp(char(cell2),'LongHair')) || (strcmp(char(cell2),'Bald'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
     elseif strcmp(char(cell1),'LongHair')
        if (strcmp(char(cell2),'ShortHair')) || (strcmp(char(cell2),'Bald'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
     elseif strcmp(char(cell1),'Bald')
        if (strcmp(char(cell2),'ShortHair')) || (strcmp(char(cell2),'LongHair'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
     elseif strcmp(char(cell1),'Male')
        if (strcmp(char(cell2),'Female'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
     elseif strcmp(char(cell1),'Female')
        if (strcmp(char(cell2),'Male'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
     %Start eye comparison
     elseif strcmp(char(cell1),'BlueEyes')
        if (strcmp(char(cell2),'BrownEyes'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
     elseif strcmp(char(cell1),'BrownEyes')
        if (strcmp(char(cell2),'BlueEyes'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
    %start facial hair comparison
    elseif strcmp(char(cell1),'NoFacialHair')
        if (strcmp(char(cell2),'Mustache')) || (strcmp(char(cell2),'Beard')) || (strcmp(char(cell2),'MustacheBeard')) || (strcmp(char(cell2),'Goatee'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
   elseif strcmp(char(cell1),'Mustache')
        if (strcmp(char(cell2),'NoFacialHair')) || (strcmp(char(cell2),'Beard')) || (strcmp(char(cell2),'MustacheBeard')) || (strcmp(char(cell2),'Goatee'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
    elseif strcmp(char(cell1),'Beard')
        if (strcmp(char(cell2),'Mustache')) || (strcmp(char(cell2),'NoFacialHair')) || (strcmp(char(cell2),'MustacheBeard')) || (strcmp(char(cell2),'Goatee'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
     elseif strcmp(char(cell1),'MustacheBeard')
        if (strcmp(char(cell2),'Mustache')) || (strcmp(char(cell2),'Beard')) || (strcmp(char(cell2),'NoFacialHair')) || (strcmp(char(cell2),'Goatee'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
     elseif strcmp(char(cell1),'Goatee')
        if (strcmp(char(cell2),'Mustache')) || (strcmp(char(cell2),'Beard')) || (strcmp(char(cell2),'MustacheBeard')) || (strcmp(char(cell2),'NoFacialHair'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
    %Start young and old comparison
     elseif strcmp(char(cell1),'Young')
        if (strcmp(char(cell2),'Old'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
     elseif strcmp(char(cell1),'Old')
        if (strcmp(char(cell2),'Young'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
    %Start HAT
     elseif strcmp(char(cell1),'Hat')
            string= strcat(cell1,cell2);
    %Start glasses
     elseif strcmp(char(cell1),'Glasses')
            string= strcat(cell1,cell2);
    %  %Start nosesize comparison
      elseif strcmp(char(cell1),'BigNose')
        if (strcmp(char(cell2),'SmallNose'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
     elseif strcmp(char(cell1),'SmallNose')
        if (strcmp(char(cell2),'BigNose'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
    %Start hairtexture
     elseif strcmp(char(cell1),'StraightHair')
        if (strcmp(char(cell2),'WavyHair')) || (strcmp(char(cell2),'CurlyHair'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
     elseif strcmp(char(cell1),'WavyHair')
        if (strcmp(char(cell2),'StraightHair')) || (strcmp(char(cell2),'CurlyHair'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
     elseif strcmp(char(cell1),'CurlyHair')
        if (strcmp(char(cell2),'WavyHair')) || (strcmp(char(cell2),'StraightHair'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
    %Eyebrows
    elseif strcmp(char(cell1),'ThickEyebrow')
        string= strcat(cell1,cell2);
    %Redcheeks
    elseif strcmp(char(cell1),'RedCheek')
        string= strcat(cell1,cell2);
    %Mouthsize
    elseif strcmp(char(cell1),'BigMouth')
        if (strcmp(char(cell2),'SmallMouth'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
     elseif strcmp(char(cell1),'SmallMouth')
        if (strcmp(char(cell2),'BigMouth'))
            string='';
        else
            string= strcat(cell1,cell2);
        end
    %SadLooking
    elseif strcmp(char(cell1),'SadLooking')
        string= strcat(cell1,cell2);
    
    end
end