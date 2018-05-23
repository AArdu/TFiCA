import numpy as np
from pgmpy.models import MarkovModel

nodes = np.load("./Data/nodes.npy").item()

all_nodes = nodes['presentFeatures'] + nodes['presentCharacters'] + \
    nodes['opponentsTiles'] + nodes['questionsAsked'] + nodes['previousFeatures']

M = MarkovModel()
M.add_nodes_from(all_nodes)

print(len(M))   
