{
  version = "0.0.0";
  timestamp = "2024-02-28T07:15:05Z";

  sources = {
    "x86_64-linux" = {
      url = "https://github.com/foundry-rs/foundry/releases/download/nightly-3dfa43bf1fa030a6c76c36a12feb4f2fe623b89b/foundry_nightly_linux_amd64.tar.gz";
      sha256 = "X/Ge3or61rsb8TkRAUuVu70rtOF7QGOPAqFcjaaW5as=";
    };
    "aarch64-linux" = {
      url = "https://github.com/foundry-rs/foundry/releases/download/nightly-551bcb5c84d672670e1e3fd897089e606d808774/foundry_nightly_linux_arm64.tar.gz";
      sha256 = "1jdnh3yva3jr02wjk4vi6y1ij3jac1l68gaiqjbfb8m5g0znk6mk";
    };
    "x86_64-darwin" = {
      url = "https://github.com/foundry-rs/foundry/releases/download/nightly-551bcb5c84d672670e1e3fd897089e606d808774/foundry_nightly_darwin_amd64.tar.gz";
      sha256 = "0prn9ykf54jk36pz7bl8g3lf0gisvk0fbf0s1mnxs4hisj1mg58l";
    };
    "aarch64-darwin" = {
      url = "https://github.com/foundry-rs/foundry/releases/download/nightly-551bcb5c84d672670e1e3fd897089e606d808774/foundry_nightly_darwin_arm64.tar.gz";
      sha256 = "01yk18xnyymky8rvibvjhnlhjd43jzgr8ff9i5y33fn04af9cwba";
    };
  };
}
