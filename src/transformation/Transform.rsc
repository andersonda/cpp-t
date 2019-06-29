module transformation::Transform

import lang::cpp::AST;

import util::Config;
import util::Utils;
import transformation::PrettyPrinter;

import IO;
import Set;

public Declarator toInitializerList(declarator([], name, equalsInitializer(expr))) = declarator([], name, initializerList([expr]));

public Declaration transform(Declaration ast){
	return top-down visit(ast){
		case d:declarator([], name, equalsInitializer(expr)) => toInitializerList(d)
	}
}

public set[Declaration] transformExamples() = mapper(examplesToASTs(), transform);

public void generateCpp(Declaration ast) = writeFile(resultFilesLoc + "/cpp/" + ast.src.file, pp(transform(ast)));

public void outputTransformations(){
	for(ast <- transformExamples()){
		generateCpp(ast);
	}
}