import sys

d = {}
cutoff = float(sys.argv[2])
for line in open(sys.argv[1]):
    data = line.rstrip().split('\t')
    query = data[0]
    hit = data[1]
    prcntid = float(data[2])
    if d.has_key(query): 
        continue
    else:
        if prcntid > cutoff:
            d[query] = hit
            print line,
