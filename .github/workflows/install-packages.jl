using TOML
using Pkg
registry = open("Registry.toml", "r") do io
    TOML.parse(io)
end
for (uuid, spec) in registry["packages"]
    Pkg.add(Pkg.PackageSpec(name=spec["name"], uuid=uuid))
end
Pkg.precompile()
