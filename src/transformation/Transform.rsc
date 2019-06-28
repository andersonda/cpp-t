module transformation::Transform

import lang::cpp::AST;

public Declarator toInitializerList(declarator([], name, equalsInitializer(expr))) = declarator([], name, initializerList([expr]));

public Declaration transform(Declaration ast){
	return top-down visit(ast){
		case d:declarator([], name, equalsInitializer(expr)) => toInitializerList(d)
	}
}