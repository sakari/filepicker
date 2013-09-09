ndll:
	cd project && haxelib run hxcpp Build.xml mac

test: ndll
	cd TestProject && openfl test cpp -debug -Ddebug

all: ndll

clean:
	git clean -fdx

.PHONY: ndll test all clean
