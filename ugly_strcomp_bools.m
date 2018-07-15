function bool = ugly_strcomp(cell1, cell2)
    if strcmp(char(cell1),'BlackHair')
        if (strcmp(char(cell2),'BrownHair')) || (strcmp(char(cell2),'BlondeHair')) || (strcmp(char(cell2),'RedHair'))
            bool=0;
        else
            bool= 1;
        end
    elseif strcmp(char(cell1),'BrownHair')
        if (strcmp(char(cell2),'BlackHair')) || (strcmp(char(cell2),'BlondeHair')) || (strcmp(char(cell2),'RedHair'))
            bool=0;
        else
            bool= 1;
        end
    elseif strcmp(char(cell1),'BlondeHair')
        if (strcmp(char(cell2),'BlackHair')) || (strcmp(char(cell2),'BrownHair')) || (strcmp(char(cell2),'RedHair'))
            bool=0;
        else
            bool= 1;
        end
    elseif strcmp(char(cell1),'RedHair')
        if (strcmp(char(cell2),'BlackHair')) || (strcmp(char(cell2),'BrownHair')) || (strcmp(char(cell2),'BlondeHair'))
            bool=0;
        else
            bool= 1;
        end
    elseif strcmp(char(cell1),'ShortHair')
        if (strcmp(char(cell2),'LongHair')) 
            bool=0;
        else
            bool= 1;
        end
     elseif strcmp(char(cell1),'LongHair')
        if (strcmp(char(cell2),'ShortHair'))
            bool=0;
        else
            bool= 1;
        end
     elseif strcmp(char(cell1),'Male')
        if (strcmp(char(cell2),'Female'))
            bool=0;
        else
            bool=1;
        end
     elseif strcmp(char(cell1),'Female')
        if (strcmp(char(cell2),'Male'))
            bool=0;
        else
            bool= 1;
        end
     %Start eye comparison
     elseif strcmp(char(cell1),'BlueEyes')
        if (strcmp(char(cell2),'BrownEyes'))
            bool=0;
        else
            bool= 1;
        end
     elseif strcmp(char(cell1),'BrownEyes')
        if (strcmp(char(cell2),'BlueEyes'))
            bool=0;
        else
            bool= 1;
        end
    %start facial hair comparison
    elseif strcmp(char(cell1),'NoFacialHair')
        if (strcmp(char(cell2),'Mustache')) || (strcmp(char(cell2),'Beard')) || (strcmp(char(cell2),'MustacheBeard'))
            bool=0;
        else
            bool= 1;
        end
   elseif strcmp(char(cell1),'Mustache')
        if (strcmp(char(cell2),'NoFacialHair')) || (strcmp(char(cell2),'Beard')) || (strcmp(char(cell2),'MustacheBeard'))
            bool=0;
        else
            bool= 1;
        end
    elseif strcmp(char(cell1),'Beard')
        if (strcmp(char(cell2),'Mustache')) || (strcmp(char(cell2),'NoFacialHair')) || (strcmp(char(cell2),'MustacheBeard'))
            bool=0;
        else
            bool= 1;
        end
     elseif strcmp(char(cell1),'MustacheBeard')
        if (strcmp(char(cell2),'Mustache')) || (strcmp(char(cell2),'Beard')) || (strcmp(char(cell2),'NoFacialHair'))
            bool=0;
        else
            bool= 1;
        end
%     %Start HAT
%      elseif strcmp(char(cell1),'Hat')
%             bool= 1;
%     %Start glasses
%      elseif strcmp(char(cell1),'Glasses')
%             bool= 1;
    %  %Start nosesize comparison
      elseif strcmp(char(cell1),'BigNose')
        if (strcmp(char(cell2),'SmallNose'))
            bool=0;
        else
            bool= 1;
        end
     elseif strcmp(char(cell1),'SmallNose')
        if (strcmp(char(cell2),'BigNose'))
            bool=0;
        else
            bool= 1;
        end
    %Start hairtexture
     elseif strcmp(char(cell1),'StraightHair')
        if (strcmp(char(cell2),'WavyHair')) || (strcmp(char(cell2),'CurlyHair'))
            bool=0;
        else
            bool= 1;
        end
     elseif strcmp(char(cell1),'WavyHair')
        if (strcmp(char(cell2),'StraightHair')) || (strcmp(char(cell2),'CurlyHair'))
            bool=0;
        else
            bool= 1;
        end
     elseif strcmp(char(cell1),'CurlyHair')
        if (strcmp(char(cell2),'WavyHair')) || (strcmp(char(cell2),'StraightHair'))
            bool=0;
        else
            bool= 1;
        end
    %Eyebrows
%     elseif strcmp(char(cell1),'ThickEyebrow')
%         bool= strcat(char(cell1),char(cell2));
%     %Redcheeks
%     elseif strcmp(char(cell1),'RedCheek')
%         bool= strcat(char(cell1),char(cell2));
    %Mouthsize
    elseif strcmp(char(cell1),'BigMouth')
        if (strcmp(char(cell2),'SmallMouth'))
            bool=0;
        else
            bool= 1;
        end
     elseif strcmp(char(cell1),'SmallMouth')
        if (strcmp(char(cell2),'BigMouth'))
            bool=0;
        else
            bool= 1;
        end
%     %SadLooking
%     elseif strcmp(char(cell1),'SadLooking')
%         bool= strcat(char(cell1),char(cell2));
    else
        bool=1;
    
    end
end