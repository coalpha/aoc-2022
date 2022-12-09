L=open("input.txt").readlines()
i=0
for l in L:a,b,c,d=map(int,l.replace(",","-").split("-"));i+=[b<=d,d<=b][a<c]or a==c
print(i)
