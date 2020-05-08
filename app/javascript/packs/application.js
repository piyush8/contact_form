// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import 'bootstrap/js/dist/alert'
import 'bootstrap/js/dist/button'
import 'bootstrap/js/dist/carousel'
import 'bootstrap/js/dist/collapse'
import 'bootstrap/js/dist/dropdown'
import 'bootstrap/js/dist/index'
import 'bootstrap/js/dist/modal'
import 'bootstrap/js/dist/popover'
import 'bootstrap/js/dist/scrollspy'
import 'bootstrap/js/dist/tab'
import 'bootstrap/js/dist/toast'
import 'bootstrap/js/dist/tooltip'
import 'bootstrap/js/dist/util'

require("packs/animsition.min.js")
require("packs/countdowntime.js")
require("packs/main.js")
require("packs/select2.min.js")
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


$( document ).on('turbolinks:load', function() {
    get_language();
});

function get_language(){
    $('#language_select').on('change', function(e){
        var language =  $(this).val();
        $.ajax({
            url: "/store_language",
            type: "get",
            dataType: 'script',
            data: { language: language },
            success: function(data) {
                location.reload();
            }
        });
    });
}