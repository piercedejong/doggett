// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)'
document.addEventListener("turbolinks:load", function() {
    $(document).ready(function() {
        $("#id-check").show()

        $(".script-option").click(function() {
            // Get the next section name
            var next = "#section-" + $(this).attr("next")
            // Reset any text_fields in the next section
            var id = $(this).attr('id')
            if (id.includes("will-support") || id.includes("will-not-support")) {
                $("#no-support-reason").val("")
            } else if (id.includes("correct-address") || id.includes("incorrect-address")) {
                $("#new-adress").val("")
            }

            $(this).parent().parent().parent().parent().nextAll().css("display", 'none')
            $(this).parent().parent().parent().parent().nextAll().find("label").removeClass("active")
            $(next).show()
            var end_call_conditions = ["continued-ringing", "do-not-call", "end-call", "deceased", "voicemail", "call-back-later", "wrong-number", "will-volunteer", "will-not-support"]
            if (next.includes("incorrect-address") || next.includes("correct-address")) {
                $("#section-volunteer-ask").show()
            } else if (end_call_conditions.some(el => next.includes(el))) {
                $("#section-submit").show()
            }
            $(document).scrollTop($(document).height())
        })

        $("#voterSearch").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#voter-table tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    })
})
