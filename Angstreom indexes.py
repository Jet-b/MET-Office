
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

with open('WNA_angst.csv', 'w') as file:
    file.write('AF,NF\n')
    for i in range(len(AF)):
        file.write(f"{AF[i]},{NF[i]}\n")
    # file.write(f"{observed},{observed}\n")