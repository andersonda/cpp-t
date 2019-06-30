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

public void outputTransformations(){
	for(ast <- transformExamples()){
		generateCpp(transform(ast), location = resultFilesLoc + "/transform/" + ast.src.file);
	}
}