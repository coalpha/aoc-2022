L=open("input.txt").readlines()
i=0
for l in L:a,b,c,d=map(int,l.replace(",","-").split("-"));i+=b==c or c<b and d>=a
print(i)
