import { Controller } from "@hotwired/stimulus";
import AESCrypto from "../../src/aes_crypto";

export default class extends Controller {
  static values = { content: String }
  static targets = ["content"];

  async decrypt() {
    const url_secrets = window.location.hash.split("/")
    const iv = url_secrets[0].substring(1)
    const key = url_secrets[1]
    const contentElement = this.contentTarget;

    const imported_key = await AESCrypto.importKey(key)
    const final = await AESCrypto.decrypt(AESCrypto.unpack(this.contentValue), imported_key, AESCrypto.unpack(iv))
    console.log(`final ${final}`)

    contentElement.value = final;

  }
}



// const imported_key = await AESCrypto.importKey(exported_key)
    // const final = await AESCrypto.decrypt(AESCrypto.unpack(cipher_text), imported_key, AESCrypto.unpack(iv_text))
    // console.log(`final ${final}`)
