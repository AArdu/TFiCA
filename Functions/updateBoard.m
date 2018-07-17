function [up_char, up_feat] = updateBoard(gboard, old_char, old_feat, hypt, answ)
    
    quest = find(string(gboard(1, :)) == string(hypt(2)));
    up_c = old_char;
    if answ == true
        % remove all the characters without this feature
        for c = 1:length(gboard(2:end, 1))
            if any(string(gboard(c + 1, 1)) == string(old_char))
                if cell2mat(gboard(c + 1, quest)) == 0
                    up_c(string(up_c) == string(gboard(c + 1, 1))) = [];
                end
            end
        end   
    elseif answ == false
        % remove all the characters that have this feature
        for c = 1:length(gboard(2:end, 1))
            if any(string(gboard(c + 1, 1)) == string(old_char))
                if cell2mat(gboard(c + 1, quest)) == 1
                    up_c(string(up_c) == string(gboard(c + 1, 1))) = [];
                end
            end
        end
    end
    
    up_char = up_c;
    
    up_f = old_feat; 
    for f = 1:length(gboard(1, 2:end))
        if any(string(gboard(1, f + 1)) == old_feat)
            if isempty(find(cell2mat(gboard(2:end, gboard(1,:) == string(gboard(1, f + 1)))), 1))
%                 sum(string(gboard(:, 1)) == up_char, f + 1) == 0
                up_f(up_f == string(gboard{1, f + 1})) = [];
            end
        end
    end
    up_f(up_f == string(hypt(2))) = [];
    up_feat = up_f;
end