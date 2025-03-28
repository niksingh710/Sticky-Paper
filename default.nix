{ pkgs, ... }:

pkgs.stdenv.mkDerivation rec {
  pname = "sticky-paper";
  version = "1.0";

  src = ./.;

  nativeBuildInputs = with pkgs;[ makeWrapper ];
  runtimeInputs = pkgs.lib.makeBinPath (with pkgs; [
    rofi-wayland
    wl-clipboard
  ]);

  installPhase = ''
    # shellcheck disable=SC2086
    # shellcheck disable=SC2154
    mkdir -p $out/bin
    mkdir -p $out/share

    # Install script and config
    cp sticky-paper $out/bin/
    chmod +x $out/bin/*

    cp -r themes $out/share/
    cp -r images $out/share/

  '';

  postFixup = ''
    # Create a wrapper to inject ROFI_THEME_STR
    wrapProgram $out/bin/sticky-paper \
    --run "export ROFI_THEME=$out/share/themes/notes.rasi" \
    --prefix PATH : ${runtimeInputs}


    substituteInPlace $out/share/themes/notes.rasi --replace "../images/paper.png" "$out/share/images/paper.png"
  '';

  meta = {
    description = "Simple Rofi notes taking utility";
    license = pkgs.lib.licenses.mit;
    maintainers = with pkgs.lib.maintainers; [ niksingh710 ];
  };
}
