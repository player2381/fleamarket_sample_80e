crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :production_new do
  link "出品ページ", new_production_path
  parent :mypage
end

crumb :card_new do
  link "カード登録", new_card_path
  parent :mypage
end

crumb :card_show do
  link "カード情報", card_path
  parent :mypage
end

crumb :production_show do
  link "商品詳細", production_path
  parent :mypage
end

crumb :production_update do
  link "商品編集", edit_production_path
  parent :production_show
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).