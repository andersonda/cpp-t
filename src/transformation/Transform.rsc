module transformation::Transform

import lang::cpp::AST;

import util::Config;
import util::Utils;
import transformation::PrettyPrinter;

import IO;
import Set;
import List;

@doc{converts classic "<type> <identifier> = <expr>;" initializations to initializer list style "<type> <identifier> {<expr>};"}
public Declaration toInitializerLists(Declaration ast){
	return top-down visit(ast){
		case d:declarator([], name, equalsInitializer(expr)) => declarator([], name, initializerList([expr]))
	}
}

@doc{converts c style strings (char arrays) to std::string}
public Declaration toStdStrings(Declaration ast){
	set[str] arrays = {};
	return top-down visit(ast){
		case simpleDeclaration(declSpecifier(modifiers, char()), d: [arrayDeclarator(_, _, _, _), _*]): {
			list[Declarator] strings = [];
			for(arrayDeclarator(pointerOperators, name, arrayModifier, initializer) <- d){
				strings += declarator(pointerOperators, name, initializer);
				arrays += name.\value;
			}
			insert simpleDeclaration(namedTypeSpecifier(modifiers, name("string")), strings);
		}
		case arraySubscriptExpression(n:idExpression(name(arrayName)), expr) : {
			if(arrayName in arrays){
				insert functionCall(fieldReference(n, name("at")), [expr]);
			}
		}
		case functionCall(idExpression(name("strlen")), params) => functionCall(fieldReference(head(params), name("length")), [])
	}
}

public Declaration transform(Declaration ast, Declaration (Declaration) transformations...){
	for(t <- transformations){
		ast = t(ast);
	}
	return ast;
}

public set[Declaration] transformExamples() = { transform(ast, toInitializerLists, toStdStrings) | ast  <- examplesToASTs() };

public void outputTransformedASTs() = astsToFiles(asts = transformExamples(), location = resultsFileLoc + "/transform/asts");

public void outputTransformedCpp(){
	for(ast <- transformExamples()){
		generateCpp(ast, location = resultFilesLoc + "/transform/cpp/" + ast.src.file);
	}
}