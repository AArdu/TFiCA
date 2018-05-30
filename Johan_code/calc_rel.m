function [rel] = calc_rel(engine, evidence, explanation, samples)
% CALC_REL computes/approximates the relevancy of the variables  
%
% INPUT
% engine must support max-propagation
% evidence{i} is the observed value of node i, or [] if hidden
% explanation is the set of variables for which an explanation is sought
% samples = 0 -> exact computation (count all MAPs), otherwise approximate using N randomly chosen samples
%
% OUTPUT
% rel{i} is the relevance of node i (cell array!) for computing MPE of explanation 
% given evidence for every i neither in explanation nor evidence

bnet = bnet_from_engine(engine);
all_values = bnet.dnodes;
all_sizes = bnet.node_sizes;
intermediates = setdiff(all_values, union(find(~isemptycell(evidence)), explanation));

evidence = evidence(:);
N = length(evidence);
rel = cell(1,N);
sample = cell(1,N);
counter = cell(1,N);

if isempty(intermediates)
	return
end

if samples == 0		% compute exact relevancy
else				% approximate relevancy using samples
	for i=1:N
		if ismember(i, intermediates)
			counter{i} = 0;
			for k=1:samples
				for j=1:N
					% pick for each variable in intermediates \ {i} a random value
					if ismember(j, setdiff(intermediates,i))
						sample{j} = ceil(all_sizes(j) * rand(1));
					elseif (i ~= j)
						sample{j} = evidence{j};
					end	
				end
				map = cell(1,all_sizes(i));
				for iv=1:all_sizes(i)
					sample{i} = iv;
					map{iv} = calc_map(engine, sample, explanation);
				end
				% now see whether map{1}, map{2}, ..., map{iv} are different wrt
				% the explanation variables
				counter{i} = counter{i} + diff_expl(map, explanation, N);
			end
			rel{i} = counter{i} / samples;
		end
		fprintf('.');
	end	
end