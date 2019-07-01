module transformation::Transform

import lang::cpp::AST;

import util::Config;
import util::Utils;
import transformation::PrettyPrinter;

import IO;
import Set;

// public Declaration toInitializerList(declarator([], name, equalsInitializer(expr))) = declarator([], name, initializerList([expr]));

@doc{converts classic "<type> <identifier> = <expr>;" initializations to initializer list style "<type> <identifier> {<expr>};"}
public Declaration toInitializerLists(Declaration ast){
	return top-down visit(ast){
		case d:declarator([], name, equalsInitializer(expr)) => declarator([], name, initializerList([expr]))
	}
}

public Declaration transform(Declaration ast, Declaration (Declaration) transformations...){
	for(t <- transformations){
		ast = t(ast);
	}
	return ast;
}

public set[Declaration] transformExamples() = { transform(ast, toInitializerLists) | ast  <- examplesToASTs() };

public void outputTransformations(){
	for(ast <- transformExamples()){
		generateCpp(ast, location = resultFilesLoc + "/transform/" + ast.src.file);
	}
}