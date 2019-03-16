{ stdenv
, fetchurl
, meson
, ninja
, pkgconfig
, gettext
, sqlite
, librest
, gnome3
, libxml2
, lua5
, liboauth
, libgdata
, libmediaart
, grilo
, gnome-online-accounts
, gmime
, json-glib
, avahi
, tracker
, dleyna-server
, itstool
, totem-pl-parser
}:

stdenv.mkDerivation rec {
  pname = "grilo-plugins";
  version = "0.3.8";

  src = fetchurl {
    url = "mirror://gnome/sources/${pname}/${stdenv.lib.versions.majorMinor version}/${pname}-${version}.tar.xz";
    sha256 = "0nync07gah3jkpb5ph5d3gwbygmabnih2m3hfz7lkvjl2l5pgpac";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkgconfig
    gettext
    itstool
  ];

  buildInputs = [
    grilo
    libxml2
    libgdata
    lua5
    liboauth
    sqlite
    gnome-online-accounts
    totem-pl-parser
    librest
    gmime
    json-glib
    avahi
    libmediaart
    tracker
    dleyna-server
  ];

  passthru = {
    updateScript = gnome3.updateScript {
      packageName = pname;
      attrPath = "gnome3.${pname}";
      versionPolicy = "none";
    };
  };

  meta = with stdenv.lib; {
    homepage = https://wiki.gnome.org/Projects/Grilo;
    description = "A collection of plugins for the Grilo framework";
    maintainers = gnome3.maintainers;
    license = licenses.lgpl21;
    platforms = platforms.linux;
  };
}
