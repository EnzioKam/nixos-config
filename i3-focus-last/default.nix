{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "i3-focus-last";
  version = "e551306c422552915f7e5ec0b7d5185d6bcd3dd1";

  src = fetchFromGitHub {
    owner = "lbonn";
    repo = pname;
    rev = version;
    sha256 = "KL3NxnzppOzlg4QW96Qh3WLHIwX0ctRdVmZR2yZhEnM=";
  };

  cargoSha256 = "K5zuJSIT2tBVWI1QXUnn1JnbeIUjPgZKgx2ts4MTy/A=";

  meta = with lib; {
    description = "Another implementation of this classic (and useful) example of i3 ipc use.";
    homepage = "https://github.com/lbonn/i3-focus-last";
    license = licenses.mit;
    maintainers = [ maintainers.tailhook ];
  };
}

