## cpp-t
---
This repository contains ongoing work to create transformations for c++ programs. The motivation behind this work is to create a tool that updates older c++ code to use the more modern features of the language. This is very much a work in progress, so **expect things to be broken, missing, or outright confusing**.

There are two dependencies you will need to download before you are able to properly run this software.
1. [The Rascal metaprogramming language](https://www.rascal-mpl.org/) is the language that this transformation tool is written in. The home page of the language contains instructions for installing it.
2. [clair](https://github.com/cwi-swat/clair) is the tool used for generating abstract syntax trees from c++ code. The instructions for installing it can be found in the readme of its repository.

As this software evolves more towards an actual usable tool, the functionality provided by it will be documented in this readme.
