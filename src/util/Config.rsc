module util::Config

@doc{location to look for c++ files to transform. By default, this is cpp-t/test}
public loc testFilesLoc = |project://cpp-t/src/test|;

@doc{location to store results files. By default, this is cpp-t/results}
public loc resultFilesLoc = |project://cpp-t/results|;