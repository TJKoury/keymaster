Module["preRun"] = function () {
  globalThis.getFolder();
  FS.mkdir("/work");
  FS.chdir("/work");
};
