// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import "@nathanvda/cocoon"
window.$ = window.jQuery = require('jquery');
require('packs/raty')
require('packs/tag-it')
require('packs/tag-it-min')
Rails.start()
Turbolinks.start()
ActiveStorage.start()
/*global $*/
$(".slide-items").slick({
    autoplay: true, // 自動再生
    fade: true, // スライドをフェードイン・フェードアウト
    cssEase: 'linear',// アニメーション
    speed: 600, // フェードアニメーションの速度設定
});