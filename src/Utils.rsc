module Utils

import lang::cpp::AST;

import IO;
import String;

public rel[loc, Declaration] examplesToASTs()
	= { <l, parseCpp(l)> | l <- |project://cpp-t/test|.ls, endsWith(l.file, ".cpp")};
	
public void astsToFiles(rel[loc, Declaration] asts = examplesToASTs()){
	for(<l, ast> <- asts){
		iprintToFile(|project://cpp-t/results/ast/| + replaceFirst(l.file, ".cpp", ".ast"), ast);
	}
}