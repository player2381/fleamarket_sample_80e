$(function(){
  let fileIndex = 1
  const buildFileField = (num)=> {
    const html = `<div class="js-file_groupi" data-index="${num}">
                    <input class="js-filei" type="file"
                    name="production[images_attributes][${num}][src]"
                    id="production_production_images_attributes_${num}_image">
                    <span class="js-removei">削除</span>
                  </div>`;
    fileIndex += 1
    return html;
  }
    // プレビュー表示用の定数です。該当インデックス番号とそれに紐づくURLと画像サイズを変数buildImgに代入している
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  $('.hidden-destroy').hide();

  // #image-boxの子要素であるjs-fileに変更がある場合にイベントが発火するようになってる
  $('#image-boxi').on('change', '.js-filei', function(e) {


    const targetIndex = $(this).parent().data('index');

    // ファイル名を取得して定数fileに代入している
    const file = e.target.files[0];


    if(!file){
      $(`.js-file_groupi[data-index=${targetIndex}]`).find(".js-removei").trigger("click");
      return false;
    }

      var blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  
      $('#previewsi').append(buildImg(targetIndex, blobUrl));
    let limitFileField = $(".js-file_groupi:last").data("index");

    // 最大5枚以上の画像は投稿できないようにしてる
    if($(".js-file_groupi").length >= 5 ){
      return false;
    } else {
      $('#image-boxi').append(buildFileField(fileIndex));

    }
    }
  });

  $('#image-boxi').on('click', '.js-removei', function() {

    // 最新のインデックス番号を取得して変数limitFileFieldに代入している
    let limitFileField = $(".js-file_groupi:last").data("index");
    const targetIndex = $(this).parent().data('index')

    // 削除ボタンを押した時に該当のインデックス番号の入った入力フォームとプレビュー画像を消せるようになっている
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    if ((targetIndex == limitFileField ) || ($(".js-file_groupi").length >= 4)) ($('#image-boxi').append(buildFileField(fileIndex)));
  });
});