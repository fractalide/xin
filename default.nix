{ racket2nix ? import ./racket2nix {}
}:

with racket2nix;

let
src = (builtins.filterSource (path: type:
  let basePath = baseNameOf path; in
  (type != "symlink" || null == builtins.match "result.*" basePath) &&
  (null == builtins.match ".*[.]nix" basePath) &&
  (null == builtins.match "[.].*[.]swp" basePath) &&
  (null == builtins.match "[.][#].*" basePath) &&
  (null == builtins.match "[#].*[#]" basePath) &&
  (null == builtins.match ".*~" basePath)
) ./xin);
attrs = rec {
  catalog = buildRacketCatalog [
    src
  ];
   xin = buildRacket { package = src; inherit catalog; };
};
in

attrs.xin // attrs
