clear all
load("prob_for_features.mat")

features_CPTs = {};

% fortunately, the order of the Booleans in the CPDs in the toolbox change
% in the same order as a progressive sequence in binary system
combinations = 0:2^15 - 1;
combinations = dec2bin(combinations);

for f = 1:length(Features)
    p_combination = [];
    for p = 1:length(combinations)
        feat = [];
        comb = combinations(p, :);
        for b = 1:length(comb) - 1
            % the positions of the characters are the first 14 in the
            % binray number. 
            if comb(b) == '1'
                % if character is True
                if Char_feat(b, f) == 1
                    % If feature is present in the character
                    feat(end + 1) = Characters(b, 2) * Features(f, 2);
                elseif Char_feat(b, f) == 0
                    feat(end + 1) = Characters(b, 2) * Features(f, 1);
                end
            elseif comb(b) == '0'
                % if character is False
                if Char_feat(b, f) == 1
                    feat(end + 1) = Characters(b, 1) * Features(f, 2);
                elseif Char_feat(b, f) == 0
                    feat(end + 1) = Characters(b, 1) * Features(f, 1);
                end
            end
        end
        % find what cooccurence is involved in this combination
        Co_n = strfind(Cooc_names, Feat_names{f});
        for cn = 1:length(Co_n)
            if isempty(Co_n{cn})
                Co_n{cn} = 0;
            end
        end
        if comb(end) == '1'
            % if cooccurence is true
            feat(end + 1) = prod(Cooccurences(find(cell2mat(Co_n)), 2));
        elseif comb(end) == '0'
            feat(end + 1) = prod(Cooccurences(find(cell2mat(Co_n)), 1));
        end
        % append probability of this combination to a list
        p_combination(end + 1) = prod(feat(1:end-1)) + feat(end);
    end
    % append the list of probabilities to the dict with all cpts
    features_CPTs{f} = [p_combination, 1 - p_combination];
end