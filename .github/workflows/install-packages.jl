using TOML
using Pkg
registry = open("Registry.toml", "r") do io
    TOML.parse(io)
end
for (uuid, spec) in registry
    Pkg.add(Pkg.PackageSpec(spec["name"], uuid))
end
Pkg.precompile()
