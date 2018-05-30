function [mfe per] = calc_mfe(engine, evidence, explanation, int_relevant, samples)
% CALC_MFE computes the Most Frugal Explanation
%
% INPUT
% engine must support max-propagation
% evidence{i} is the observed value of node i, or [] if hidden
% explanation is the set of variables for which an explanation is sought (sorted!)
% int_relevant is the set of intermediate variables for which we marginalize (sorted!)
% samples = 0 -> exact MFE (count all MAPs), otherwise approximate using N randomly chosen samples
%
% OUTPUT
% mfe{i} is the best explanation of node i (cell array!), according to MFE
% for every i in explanation
% per is the percentage of the mpe's for that explanation

bnet = bnet_from_engine(engine);
all_values = bnet.dnodes;
all_sizes = bnet.node_sizes;
expl_sizes = all_sizes(explanation);
int_irrelevant = setdiff(all_values, union(find(~isemptycell(evidence)), union(explanation, int_relevant)));

N = length(evidence);
sample = cell(1,N);
% create an matrix to count all possible joint value assignments to the explanation set
maj_size = prod(expl_sizes);
maj = zeros(1,maj_size);
divider = zeros(1,length(expl_sizes));
maj_size_c = maj_size;
for i=1:length(expl_sizes)
	maj_size_c = maj_size_c / expl_sizes(i);
	divider(i) = maj_size_c;
end	
mfe = cell(1,N);

if samples == 0		% compute exact MFE
	pointer = 0;
	for j=1:N
		% pick for each variable in int_irrelevant a random value
		if ismember(j, int_irrelevant)
			sample{j} = 1;
			pointer = j;		% will point to last irrelevant variable
		else
			sample{j} = evidence{j};
		end	
	end
	pointer_msb = pointer;
	if (pointer_msb == 0)
		[mfe] = calc_map(engine, sample, explanation);
		per = 1;
		return
	else	
		while pointer_msb > 0
			[map] = calc_map(engine, sample, explanation);		
			% increase the values in maj for the MAP values
			% calculate index in maj;
			inc = 0;
			ind = 0;
			for j=1:N
				if ismember(j, explanation)
					ind = ind + 1;
					inc = inc + (map{j} - 1) * divider(ind);
				end	
			end
			maj(inc + 1) = maj(inc + 1) + 1;
			sample{pointer} = sample{pointer} + 1;
			pointer_inc = pointer;
			while sample{pointer_inc} > all_sizes(pointer_inc)
				sample{pointer_inc} = 1;
				pointer_inc = pointer_inc - 1;
				while (not(ismember(pointer_inc, int_irrelevant))) && (pointer_inc > 0)
					pointer_inc = pointer_inc - 1;
				end
				if pointer_inc > 0
					sample{pointer_inc} = sample{pointer_inc} + 1;
				else
					pointer_msb = 0;
					break
				end
				if (pointer_msb > pointer_inc) 
					pointer_msb = pointer_inc;
				end
			end
		end
	end
else				% approximate MFE using samples
	for i=1:samples
		for j=1:N
			% pick for each variable in int_irrelevant a random value
			if ismember(j, int_irrelevant)
				sample{j} = ceil(all_sizes(j) * rand(1));
			else
				sample{j} = evidence{j};
			end	
		end
		[map] = calc_map(engine, sample, explanation);		
		% increase the values in maj for the MAP values
		% calculate index in maj;
		inc = 0;
		ind = 0;
		for j=1:N
			if ismember(j, explanation)
				ind = ind + 1;
				inc = inc + (map{j} - 1) * divider(ind);
			end	
		end
		maj(inc + 1) = maj(inc + 1) + 1;
	end
end
% now decide upon the majority of the MAP values and set them to mfe
% uncomment the next three lines if you don't want to see the distribution
[A,B,C] = find(maj);
B
C
[maxmfe, index] = max(maj);
per = maxmfe / sum(maj);
% get explanation values from index
i = 0;
index = index - 1;
for j=1:N
	if ismember(j, explanation)
		i = i + 1;
		mfe{j} = div(index, divider(i)) + 1;
		index = index - (mfe{j} - 1) * divider(i);
	end	
end	

