module analysis::Variables

import lang::cpp::AST;

public set[Statement] extractDeclarationStatements(Declaration ast){
	set[Statement] res = {};
	top-down visit(ast){
		case d: declarationStatement(simpleDeclaration(_, _)) : res += d;
	}
	return res;
}