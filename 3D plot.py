from mpl_toolkits import mplot3d
import numpy as np
import matplotlib.pyplot as plt
import random

def angst(r, t):
    return (r/20) + ((27-t)/10)


with open('WNA_humidity.csv', 'r') as file:
    data = file.readlines()[1:]
    split_data = data[0].split(',')
    observed = split_data[-1]
    data[0] = f"{split_data[0]},{split_data[1]},,\n"

    AFH = []
    NFH = []
    for line in data:
        split_line = line.split(',')
        AFH.append(split_line[0])
        NFH.append(split_line[1])


with open('WNA_temperature.csv', 'r') as file:
    data = file.readlines()[1:]
    split_data = data[0].split(',')
    observed = split_data[-1]
    data[0] = f"{split_data[0]},{split_data[1]},,\n"

    AFT = []
    NFT = []
    for line in data:
        split_line = line.split(',')
        AFT.append(split_line[0])
        NFT.append(split_line[1])

AF = []
for temp in AFT:
    for hum in AFH:
        AF.append(angst(float(hum), float(temp)))

NF = []
for temp in NFT:
    for hum in NFH:
        NF.append(angst(float(hum), float(temp)))

fig = plt.figure()
ax = plt.axes(projection='3d')

plt.title('Angstreom Indexes')
ax.set_xlabel('Temperature')
ax.set_ylabel('Humidity')
ax.set_zlabel('Angstreom Index')

data = [[],[],[]]
for temp in AFT:
    for hum in AFH:
        data[0].append(float(temp))
        data[1].append(float(hum))
        data[2].append(angst(float(hum), float(temp)))

realdata = [[],[],[]]
for i in range(1000):
    rand = random.randint(0, len(data[0])-1)
    realdata[0].append(data[0][rand])
    realdata[1].append(data[1][rand])
    realdata[2].append(data[2][rand])


ax.scatter3D(*realdata, c=realdata[2], cmap='viridis')

plt.show()