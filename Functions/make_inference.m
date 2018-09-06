function marginal_probs = make_inference(engine, evidence_cell, marginal_n)

    [engine, loglik] = enter_evidence(engine, evidence_cell);
    m = marginal_nodes(engine, {marginal_n});
    marginal_probs = m.T;
end