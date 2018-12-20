$(document).on('ready page:load', function () {
    if (typeof tinyMCE != 'undefined') {
      tinyMCE.init({
        selector: "textarea.tinymce",
        toolbar: [
          "styleselect | bold italic | alignleft aligncenter alignright alignjustify",
          "bullist numlist outdent indent | link image | code | codesample"
        ],
        style_formats_merge: true,
      style_formats: [
        {
          title: 'Spaced-para',
          selector: 'p',
          styles: {
            'margin': '42px 0px'
          },
          classes: "custom-class"
        },
        {
          title: 'Red-header',
          selector: 'h2',
          styles: {
            'color': 'red'
          },
          classes: "red-item header-item"
        }
      ],
        plugins: "image,link,code,codesample,autoresize,imagetools,media,table,insertdatetime,charmap,print,preview,anchor,searchreplace,visualblocks,fullscreen"
      });
    } else {
      setTimeout(arguments.callee, 50);
    }
  });