%.exe: %.cr
	cd $(dir $<) & crystal run --no-debug $(notdir $<)

p1%: dec%/p1.exe
	-

p2%: dec%/p2.exe
	-

.SECONDARY:
