"use strict";var{totalmem:o}=require("os"),n=require("electron"),t=o()*.85;function i(e){return n.ipcRenderer.invoke("os-notification",e)}module.exports={ramValue:t,invokeOsNotification:i};
