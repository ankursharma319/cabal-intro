# Cabal

https://www.youtube.com/watch?v=a7R-2vtPLDM

https://cabal.readthedocs.io/en/3.4/getting-started.html


`Cabal` is a haskell library while `cabal-install` is a command line program.

```bash
mkdir -p greeter
cd greeter
cabal v2-update
cabal v2-init --interactive
cabal v2-build
cabal v2-repl

cabal v2-run greeter
cabal v2-run greeter-test
cabal v2-clean
```

With recent versions `build`, `v2-build` and `new-build` refer to the same thing. But `build` used to be `v1-build` earlier and in that case it would look for dependencies in the global/user installations. This means there could be dependeny conflict if having multiple haskell projects on the same machine.

They solved this by creating sandoxed builds but that is now replaced by nix-style builds.
The `new-build` solves this by using nix-style builds.

## Nix style builds

 - Doesnt actually use nix, just inspired by it.
 - build output in `./dist-newstyle`
 - local build cache in `./dist-newstyle/cache`
 - The point is that the external packages are downloaded and stored in `~/.cabal/store` with hashing , just like nix store. These can be used easily across different projects. Deleting the store is safe, everything will just be rebuilt on next `build`.


The global configuration file for `cabal-install` is in `~/.cabal/config`.
The cache etc. is also located in `~/.cabal`

To download a package from hackage and make it available for system wide use (including executables), `cabal install [PACKAGE...]`

Cabal packages are really source packages. They can be compiled into "GHC packages" and also translated into OS packages (with lib include bin etc. also)

## Nix integeration

Its possible to convert the cabal build files into shell.nix files using the tool `cabal2nix`. (https://cabal.readthedocs.io/en/3.4/nix-integration.html)
