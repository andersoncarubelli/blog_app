require 'rails_helper'

RSpec.feature 'Edting article' do
  before do
    @article = Article.create(title: 'Title One', body: 'Body of article one')
  end

  scenario 'A user updates an article' do
    visit '/'

    click_link @article.title
    click_link 'Edit article'

    fill_in 'Title', with: 'Updated title'
    fill_in 'Body', with: 'Update body'

    click_button 'Update article'

    expect(page).to have_content('Article has been updated')
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario 'A user fails to update an article' do
    visit '/'

    click_link @article.title
    click_link 'Edit article'

    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Update body'

    click_button 'Update article'

    expect(page).to have_content('Article has not been updated')
    expect(page.current_path).to eq(article_path(@article))
  end
end
