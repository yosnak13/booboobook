$(document).on('turbolinks:load', function () {
  // テーブル行全体をリンク化。クリックすると詳細画面へ遷移する
  $(".admins_user_index_clickable").click(function() {
    location.href = $(this).data("link");
  });
});