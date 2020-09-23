using TOML
using Pkg
registry = open("Registry.toml", "r") do io
    TOML.parse(io)
end
for (uuid, spec) in registry["packages"]
    println("Installing $(spec["name"]) in $(spec["path"]) with UUID=$uuid")
    Pkg.add(Pkg.PackageSpec(name=spec["name"], uuid=uuid))
end
Pkg.precompile()
