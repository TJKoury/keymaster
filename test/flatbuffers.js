import assert from "assert";
import flatbuffers from "../lib/flatbuffers/flatbuffers.mjs";
globalThis.__dirname = "/";

describe("create a flatbuffer", function () {
  this.timeout(5000);

  beforeEach(async function () {});
  it("does the flatbuffer", async function () {
    let fb = await await flatbuffers();
    console.log(fb);
    const api = {
      message: fb.cwrap("hello", "string", []),
    };
    console.log("asdf", api.message());
  });
});
