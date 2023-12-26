import { Controller } from "@hotwired/stimulus";
import AESCrypto from "../../src/aes_crypto";

export default class extends Controller {
  static values = { content: String }
  static targets = ["content"];

  async decrypt() {
    const url_secrets = window.location.hash.split("secret")
    const iv = url_secrets[0].substring(1)
    const key = url_secrets[1]
    const contentElement = this.contentTarget;

    const imported_key = await AESCrypto.importKey(key)
    const decryptedContent = await AESCrypto.decrypt(AESCrypto.unpack(this.contentValue), imported_key, AESCrypto.unpack(iv))

    contentElement.value = decryptedContent;
  }
}
