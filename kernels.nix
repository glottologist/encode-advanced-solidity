{pkgs, ...}: {
  kernel.python.encode = {
    enable = true;
    displayName = "Encode  Kernel";
    extraPackages = ps: [ps.numpy ps.scipy ps.sympy ps.ecpy ps.eth-abi ps.eth-hash ps.eth-keys ps.eth-rlp ps.web3 ps.eth-utils];
  };
}
