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

// pretty printing for types
public str pp(unspecified()) = ""; // what should this print?
public str pp(\void()) = "void";
public str pp(char()) = "char";
public str pp(integer()) = "int";
public str pp(float()) = "float";
public str pp(double()) = "double";
public str pp(\bool()) = "bool";
public str pp(wchar_t()) = "wchar_t";
public str pp(typeof()) = "typeof";
public str pp(decltype()) = "decltype";
public str pp(auto()) = "auto";
public str pp(char16_t()) = "char16_t";
public str pp(char32_t()) = "char32_t";
public str pp(int128()) = "int128";
public str pp(float128()) = "float128";
public str pp(decimal32()) = "decimal32";
public str pp(decimal64()) = "decimal64";
public str pp(decimal128()) = "decimal128";

// pretty printing for modifiers
public str pp(typedef()) = "typedef";
public str pp(extern()) = "extern";
public str pp(static()) = "static";
public str pp(modAuto()) = "auto";
public str pp(register()) = "register";
public str pp(mutable()) = "mutable";
public str pp(\public()) = "public";
public str pp(\private()) = "private";
public str pp(protected()) = "protected";
public str pp(unspecifiedInheritance()) = ""; // what should this be?
public str pp(signed()) = "signed";
public str pp(unsigned()) = "unsigned";
public str pp(short()) = "short";
public str pp(long()) = "long";
public str pp(longlong()) = "long long";
public str pp(complex()) = "complex";
public str pp(imaginary()) = "imaginary";
public str pp(const()) = "const";
public str pp(volatile()) = "volatile";
public str pp(restrict()) = "restrict";
public str pp(inline()) = "inline";
public str pp(final()) = "final";
public str pp(override()) = "override";
public str pp(friend()) = "friend";
public str pp(virtual()) = "virtual";
public str pp(explicit()) = "explicit";
public str pp(constexpr()) = "constexpr";
public str pp(threadLocal()) = "thread_local";
public str pp(pureVirtual()) = "virtual";
public str pp(typename()) = "typename";
public str pp(captDefUnspecified()) = ""; // TODO
public str pp(capDefByCopy()) = ""; // TODO
public str pp(captDefByReference()) = ""; // TODO

// expression pretty printing helpers
private str ppExpr(Expression lhs, Expression rhs, str op) = "<pp(lhs)> <op> <pp(rhs)>";
private str ppExpr(str op, Expression expr) = "<op><pp(epxpr)>";
private str ppExpr(Expression expr, str op) = "<pp(expr)><op>";


public default str pp(node n) { "Pretty printing logic for node <n> is not yet supported!"; }