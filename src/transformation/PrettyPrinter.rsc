module transformation::PrettyPrinter

import lang::cpp::AST;

// binary operator expression pretty printing logic
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

// unary operator expression pretty printing logic
public str pp(prefixIncr(expr)) = ppExpr("++", expr);
public str pp(prefixDecr(expr)) = ppExpr("--", expr);
public str pp(plus(expr)) = ppExpr("+", expr);
public str pp(minus(expr)) = ppExpr("-", expr);
public str pp(star(expr)) = ppExpr("*", expr);
public str pp(amper(expr)) = ppExpr("&", expr);
public str pp(tilde(expr)) = ppExpr("~", expr);
public str pp(not(expr)) = ppExpr("!", expr);
public str pp(sizeof(expr)) = ppExpr("sizeof ", expr);
public str pp(postfixIncr(expr)) = ppExpr(expr, "++");
public str pp(postfixDecr(expr)) = ppExpr(expr, "--");
public str pp(bracketed(expr)) = "(<pp(expr)>)";
public str pp(\throw()) = "throw()";
public str pp(\throw(expr)) = ppExpr("throw", expr);
public str pp(typeid(expr)) = ppExpr("typeid", expr);
public str pp(alignof(expr)) = "alignof(<pp(expr)>)";
public str pp(sizeofParameterPack(expr)) = "sizeof...(<pp(expr)>)";
public str pp(noexcept(expr)) = "noexcept(<pp(expr)>)";
public str pp(labelReference(expr)) = "&&<pp(expr)>";

// expression pretty printing helpers
private str ppExpr(Expression lhs, Expression rhs, str op) = "<pp(lhs)> <op> <pp(rhs)>";
private str ppExpr(str op, Expression expr) = "<op><pp(epxpr)>";
private str ppExpr(Expression expr, str op) = "<pp(expr)><op>";