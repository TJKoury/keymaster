import assert from "assert";
import flatbuffers from "../lib/flatbuffers/flatbuffers.mjs";
globalThis.__dirname = "/";

describe("create a flatbuffer", function () {
  this.timeout(5000);

  beforeEach(async function () {});
  it("does the flatbuffer", async function () {
    let fb = await flatbuffers();
    console.log(fb);
 
  });
});
