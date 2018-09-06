classdef Agent < handle
    properties
        bnet
        BN_engine
        allFeatures
        allCharacters
        allNodes
        agent_board
        agent_mystery
        ag_mys_features
        ag_feat_hypo
        ag_char_hypo
        winner
    end
    
    methods
        %% Update nodes with previous choices of opponent
        function question = formulate_question(obj)
            % TODO use HBS and MFE here
            % TODO define evidence in cell arrays
            q = [];
            marg_char = make_inference(obj.BN_engine, evidence_feat, 1); % insert evidence for features to get character 
            if max(marg_char) > 0.8
                q(1) = 2;
                q(2) = argmax(marg_char);
            else
                marg_feat = make_inference(obj.BN_engine, evidence_char, 1);
                q(1) = 1;
                q(2) = argmax(marg_feat);
            end
                
            question = q;
        end
        
        %%
    end
end