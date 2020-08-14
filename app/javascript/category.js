$(document).ready(function(){
  $(function(){
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーの表示作成
    function appendChidrenBox(insertHTML){
        var childSelectHtml = '';
        childSelectHtml = `<div class='exhibitionPage__main__contents__detail__category__choose__added' id= 'children_wrapper'>
                            <div class='exhibitionPage__main__contents__detail__category__choose1'>
                              <i class='fas fa-chevron-down exhibitionPage__main__contents__detail__category__choose--arrow-down'></i>
                              <select class="exhibitionPage__main__contents__detail__category__choose--select" id="child_category" name="production[category_id]">
                                <option value="---" data-category="---">---</option>
                                ${insertHTML}
                              <select>
                            </div>
                          </div>`;
        $('.products_new-product_explanation__category').append(childSelectHtml);
      }
  
      // 孫カテゴリーの表示作成
      function appendGrandchidrenBox(insertHTML){
        var grandchildSelectHtml = '';
        grandchildSelectHtml = `<div class='exhibitionPage__main__contents__detail__category__choose__added' id= 'grandchildren_wrapper'>
                                  <div class='exhibitionPage__main__contents__detail__category__choose2'>
                                    <i class='fas fa-chevron-down exhibitionPage__main__contents__detail__category__choose--arrow-down'></i>
                                    <select class="exhibitionPage__main__contents__detail__category__choose__box--select" id="grandchild_category" name="production[category_id]">
                                      <option value="---" data-category="---">---</option>
                                      ${insertHTML}
                                    </select>
                                  </div>
                                </div>`;
        $('.products_new-product_explanation__category').append(grandchildSelectHtml);
      }
  
      // 親カテゴリー選択後のイベント
      // 親はクラスのIDの方を選択してあげる
      $('#production_category').on('change', function(){
        var parent_category_id = document.getElementById('production_category').value; //選択された親カテゴリーの名前を取得
        console.log(parent_category_id)
        if (parent_category_id != "選択してください"){ //親カテゴリーが初期値でないことを確認
          $.ajax({
            url: '/productions/category/get_category_children',
            type: 'GET',
            data: { parent_id: parent_category_id },
            dataType: 'json'
          })
          .done(function(children){
            $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
            $('#grandchildren_wrapper').remove();
            var insertHTML = '';
            children.forEach(function(child){
              insertHTML += appendOption(child);
            });
            appendChidrenBox(insertHTML);
          })
          .fail(function(){
            alert('カテゴリー取得に失敗しました');
          })
        }else{
          $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除する
          $('#child_category').remove();
        }
      });
  
      // 子カテゴリー選択後のイベント
      // これは元々HTMLに表示されているクラスをレシーバーとして指定する必要がある
      $('.products_new-product_explanation__category').on('change', '#child_category', function(){
        var child_category_id = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
        if (child_category_id != "--"){ //子カテゴリーが初期値でないことを確認
          $.ajax({
            url: '/productions/category/get_category_grandchildren',
            type: 'GET',
            data: { child_id: child_category_id },
            dataType: 'json'
          })
          .done(function(grandchildren){
            if (grandchildren.length != 0) {
              $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除する
              var insertHTML = '';
              grandchildren.forEach(function(grandchild){
                insertHTML += appendOption(grandchild);
              });
              appendGrandchidrenBox(insertHTML);
            }
          })
          .fail(function(){
            alert('カテゴリー取得に失敗しました');
          })
        }else{
          $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
        }
      });
    });
  });

  