$(document).on('turbolinks:load', ()=> {
    // 画像用のinputを生成する関数
    const buildFileField = (index)=> {
      const html = `<div data-index="${index}" class="class_products_new-uploader__label" id="image-box">
                      <input class="productions_new-js-file" type="file" 
                        name="production[images_attributes][${index}][src]" 
                        id="production_images_attributes_${index}_src">
                      <div class="js-remove">
                        <span>削除</span>
                      </div>
                    </div>`;
      return html;
    }
  
    // file_fieldのnameに動的なindexをつける為の配列
    let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    console.log(fileIndex)
  
    $('#image-box').on('change', '.productions_new-js-file', function(e) {
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    });
  
    $('#image-box').on('click', '.js-remove', function() {
      $(this).parent().remove();
      // 画像入力欄が0個にならないようにしておく
      if ($('.productions_new-js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    });
  });