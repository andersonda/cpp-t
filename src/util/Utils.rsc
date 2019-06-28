module util::Utils

import lang::cpp::AST;

import util::Config;

import IO;
import String;

public rel[loc, Declaration] examplesToASTs()
	= { <l, parseCpp(l)> | l <- testFilesLoc.ls, endsWith(l.file, ".cpp")};
	
public void astsToFiles(rel[loc, Declaration] asts = examplesToASTs()){
	for(<l, ast> <- asts){
		iprintToFile(resultFilesLoc + "/ast/" + replaceFirst(l.file, ".cpp", ".ast"), ast);
	}
}