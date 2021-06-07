module.exports = {
  networks: {
   development: {
     host: "127.0.0.1",
     port: 5777,
     network_id: "*"
   },
   test: {
     host: "127.0.0.1",
     port: 5777,
     network_id: "*"
   }
  },
  compiler: {
    solc: {
      version: "0.8.4+commit.c7e474f2.Emscripten.clang"
    }
  }
};

// remixd -s ./ --remix-ide https://remix.ethereum.org/#optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.4+commit.c7e474f2.js