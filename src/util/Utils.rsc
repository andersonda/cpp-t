module util::Utils

import lang::cpp::AST;

import util::Config;
import transformation::PrettyPrinter;

import IO;
import String;

public Declaration exampleToAST(str filename) = parseCpp(testFilesLoc + filename);

public set[Declaration] examplesToASTs()
	= { parseCpp(l) | l <- testFilesLoc.ls, endsWith(l.file, ".cpp")};
	
public void astsToFiles(set[Declaration] asts = examplesToASTs(), loc location = resultFilesLoc + "/ast/"){
	for(ast <- asts){
		iprintToFile(location + replaceFirst(ast.src.file, ".cpp", ".ast"), ast);
	}
}

public void generateCpp(Declaration ast, loc location = resultFilesLoc + "/cpp/" + ast.src.file) = writeFile(location, pp(ast));
