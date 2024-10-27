const { ethers } = require("ethers");
const fs = require("fs-extra");
require("dotenv").config();

async function main() {
  const wallet = new ethers.Wallet(process.env.PRIVATE_KEY);
  const encryptedKeyJson = await wallet.encrypt(
    process.env.PRIVATE_KEY_PASSWORD
  );

  //console.log(encryptedKeyJson);
  fs.writeFileSync("./encryptedKey.json", encryptedKeyJson);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.log(error);
    process.exit(1);
  });
