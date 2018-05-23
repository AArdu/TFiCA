import scipy.io, io
import numpy as np

"""
Creates data from .mat file and saves them in a dictionary
"""
try:
    if not os.path.isfile('./Data/Names_Features.mat'):
        print("File does not exist. Use 'create_data.m first.'")
    mat = scipy.io.loadmat('./Data/Names_Features.mat')

    chNames = mat['CharacterNames'].reshape(-1)
    chNames = [chNames[i].tolist() for i in range(chNames.shape[0] - 1)]
    chNames = [chNames[i][0] for i in range(len(chNames))]

    featNames = mat['FeatureNames'].reshape(-1)
    featNames = [featNames[i].tolist() for i in range(featNames.shape[0] - 1)]
    featNames = [featNames[i][0] for i in range(len(featNames))]

    # create lists of names for the nodes in the BN
    nodes = {}
    nodes['presentFeatures'] = ["present" + f for f in featNames]
    nodes['presentCharacters'] = ["present" + c for c in chNames]
    nodes['opponentsTiles'] = ["nOpponentTiles"]
    nodes['questionsAsked'] = ["asked" + f for f in featNames]
    nodes['previousFeatures'] = ["previous" + f for f in featNames]

    np.save('./Data/nodes.npy', nodes)

    c = np.load('./Data/nodes.npy').item()
    print("Checking that file is not empty.")
    print(c['presentFeatures'][0], c['presentCharacters'][0], c['opponentsTiles'][0],c['questionsAsked'][0],c['previousFeatures'][0])

except Exception as e:
    print(e)
