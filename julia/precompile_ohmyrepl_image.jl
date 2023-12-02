using PackageCompiler
PackageCompiler.create_sysimage(:OhMyREPL; precompile_statements_file="ohmyrepl_precompile.jl", replace_default=true)
