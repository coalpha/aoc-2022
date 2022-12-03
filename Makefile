%/p1.exe: %/p1.cr %/shared.cr
	crystal build --no-debug --release -o $@ $<

%/p2.exe: %/p2.cr %/shared.cr
	crystal build --no-debug --release -o $@ $<

p1%: dec%/p1.exe
	-cd dec$* & p1.exe

p1%: dec%/p1.exe dec%/shared.cr
	-cd dec$* & p1.exe

p2%: dec%/p2.exe
	-cd dec$* & p2.exe

.SECONDARY:
