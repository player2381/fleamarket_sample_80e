$(function(){
  let fileIndex = 1
  const buildFileField = (num)=> {
    const html = `<div class="js-file_groupi" data-index="${num}">
                    <input class="js-filei" type="file"
                    name="production[production_images_attributes][${num}][image]"
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

    // #image-boxの子要素であるjs-fileに変更がある場合にイベントが発火するようになってる
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

    // 最大10枚以上の画像は投稿できないようにしてる
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
    if ((targetIndex == limitFileField ) || ($(".js-file_groupi").length >= 9)) ($('#image-boxi').append(buildFileField(fileIndex)));
  });
});









// $(function(){
//   //DataTransferオブジェクトで、データを格納する箱を作る
//   let dataBox = new DataTransfer();
//   console.log(dataBox)
//   //querySelectorでfile_fieldを取得
//   let file_field = document.querySelector('input[type=file]')
//   //fileが選択された時に発火するイベント

//   $('#img-file').change(function(){
//     // let files = [1,2,3,4,5,6,7,8,9,10];
//     //選択したfileのオブジェクトをpropで取得
//     let files = $('input[type="file"]').prop('files')[0];
//     $.each(this.files, function(i, file){
//       console.log(this.files)
//       console.log(i)
//       console.log(file)
      
//       //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
//       let fileReader = new FileReader();

//        //DataTransferオブジェクトに対して、fileを追加
//       dataBox.items.add(file)
//        //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
//       file_field.files = dataBox.files

//       var num = $('#file').length + 1 + i
//       console.log(num)
//       fileReader.readAsDataURL(file);
//       //画像が10枚になったら超えたらドロップボックスを削除する
//       if (num == 5){
//         $('.input-area').css('display', 'none')   
//       }
//       //読み込みが完了すると、srcにfileのURLを格納
//       fileReader.onloadend = function() {
//       let src = fileReader.result
//       let html= `<img src="${src}" width="114" height="80" "data-index"=${num} id="file">
//                 <div class="item-image__operetion">
//                   <div class="item-image__operetion--delete">削除</div>
//                 </div>`
//       //image_box__container要素の前にhtmlを差し込む
//       $('#image-box__container').before(html);
//       };

//       $(document).on('click', '.item-image__operetion--delete', function() {
//         console.log("OK")
//         // 画像入力欄が0個にならないようにしておく
//         // let target_image = $(this).parent().parent()
//         // target_image.remove();
        
//         $('#img')().remove();
//         if ($('.input-area').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
//       });
//       fileReader.readAsDataURL(file);
//     });
//   });











// $(document).on('turbolinks:load', ()=> {
//     // 画像用のinputを生成する関数
//     const buildFileField = (index)=> {
//       const html = `<div class="jsfile-group">
//                       <input class="productions_new-js-file" type="file" 
//                         name="production[images_attributes][${index}][src]" 
//                         id="production_images_attributes_${index}_src">
//                       <div class="js-remove">
//                         <span>削除</span>
//                       </div>
//                     </div>`;
//       return html;
//     }

    // const buildImg = (src)=> {
    //   const html = `<img "#previews"=src="${src}" width="100px" height="100px">`;
    //   return html;
    // // }
    // const buildImg = (index, url)=> {
    //   const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    //   return html;
    // }
  
    // file_fieldのnameに動的なindexをつける為の配列
    // let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  
    // $('#image-box').on('change', '.productions_new-js-file', function(e) {
    //   // fileIndexの先頭の数字を使ってinputを作る
    //   const targetIndex = $(this).parent().data('index');
    //   // ファイルのブラウザ上でのURLを取得する
    //   const file = e.target.files[0];
    //   const blobUrl = window.URL.createObjectURL(file);
    //   $('#image-box').append(buildFileField(fileIndex[0]));
    //   fileIndex.shift();
    //   let url=(src)
    //   buildImg(index,url)
    //   // 末尾の数に1足した数を追加する
    //   fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    // });
  
//     $('#image-box__container').on('click', '.js-remove', function() {
//       // 画像入力欄が0個にならないようにしておく
//       $(this).parent().remove();
//       if ($('.input-area').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
//     });
//   });
// });