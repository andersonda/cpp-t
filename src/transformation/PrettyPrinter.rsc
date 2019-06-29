module transformation::PrettyPrinter

import lang::cpp::AST;

// Expression pretty printing logic
public str pp(multiply(lhs, rhs)) = ppExpr(lhs, rhs, "*");
public str pp(divide(lhs, rhs)) = ppExpr(lhs, rhs, "/");
public str pp(modulo(lhs, rhs)) = ppExpr(lhs, rhs, "%");
public str pp(plus(lhs, rhs)) = ppExpr(lhs, rhs, "+");
public str pp(minus(lhs, rhs)) = ppExpr(lhs, rhs, "-");
public str pp(shiftLeft(lhs, rhs)) = ppExpr(lhs, rhs, "\<\<");
public str pp(shiftRight(lhs, rhs)) = ppExpr(lhs, rhs, "\>\>");
public str pp(lessThan(lhs, rhs)) = ppExpr(lhs, rhs, "\<");
public str pp(greaterThan(lhs, rhs)) = ppExpr(lhs, rhs, "\>");
public str pp(lessEqual(lhs, rhs)) = ppExpr(lhs, rhs, "\<=");
public str pp(greaterEqual(lhs, rhs)) = ppExpr(lhs, rhs, "\>=");
public str pp(binaryAnd(lhs, rhs)) = ppExpr(lhs, rhs, "&");
public str pp(binaryXor(lhs, rhs)) = ppExpr(lhs, rhs, "^");
public str pp(binaryOr(lhs, rhs)) = ppExpr(lhs, rhs, "|");
public str pp(logicalAnd(lhs, rhs)) = ppExpr(lhs, rhs, "&&");
public str pp(logicalOr(lhs, rhs)) = ppExpr(lhs, rhs, "||");
public str pp(assign(lhs, rhs)) = ppExpr(lhs, rhs, "=");
public str pp(multiplyAssign(lhs, rhs)) = ppExpr(lhs, rhs, "*=");
public str pp(divideAssign(lhs, rhs)) = ppExpr(lhs, rhs, "/=");
public str pp(moduloAssign(lhs, rhs)) = ppExpr(lhs, rhs, "%=");
public str pp(plusAssign(lhs, rhs)) = ppExpr(lhs, rhs, "+=");
public str pp(minusAssign(lhs, rhs)) = ppExpr(lhs, rhs, "-=");
public str pp(shiftLeftAssign(lhs, rhs)) = ppExpr(lhs, rhs, "\<\<=");
public str pp(shiftRightAssign(lhs, rhs)) = ppExpr(lhs, rhs, "\>\>=");
public str pp(binaryAndAssign(lhs, rhs)) = ppExpr(lhs, rhs, "&=");
public str pp(binaryXorAssign(lhs, rhs)) = ppExpr(lhs, rhs, "^=");
public str pp(binaryOrAssign(lhs, rhs)) = ppExpr(lhs, rhs, "|=");
public str pp(equals(lhs, rhs)) = ppExpr(lhs, rhs, "==");
public str pp(notEquals(lhs, rhs)) = ppExpr(lhs, rhs, "!=");


private str ppExpr(Expression lhs, Expression rhs, str op) = "<pp(lhs)> <op> <pp(rhs)>";