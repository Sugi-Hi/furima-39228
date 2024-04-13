// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("../card")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("../item_price");


// エラー対処1
let promise = chrome.tabs.sendMessage(tabs[0].id, msg);
promise.catch((error) => {
    //console.log(error);
});
// エラー対処2
// var promise = Promise.reject(new Error('promise!!!'));

// setTimeout(function() {promise.catch(/* 適切なエラーハンドル */);}