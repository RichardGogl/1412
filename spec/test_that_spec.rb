require 'spec_helper'

describe 'TestThat' do

  context 'it tests that' do

    def visit_site
      find('cite', text: 'transfermarket.com', match: :first).find(:xpath, './../../../..').find('a', match: :first).click
      5.times do
        sleep(5+rand*5)
        all('a').sample.click
      end
    end

    it 'works', :type => :feature do
      Capybara.current_driver = :selenium
      Capybara.app_host = 'http://www.google.com'
      visit '/'
      find('input', match: :first).set 'transfermarket'
      find('.spell_orig', text: 'transfermarket').click
      require 'pry'
      10.times do |i|
        if all('cite', text: 'transfermarket.com').count == 0
          find('#pnnext').click
        else
          puts "Found on page #{i}"
          puts all('.g').map(&:text)
          visit_site
          break
        end
      end
      find('input', match: :first).set 'transfermarket.com'
      find('.spell_orig', text: 'transfermarket.com').click
      visit_site
      puts "GIT: #{`git status`}"
      puts "COMMIT: #{`git commit --allow-empty -m "#{rand}"`}"
      puts "SET EMAIL: #{`git config --global user.email "RichardGogl123@gmail.com"`}"
      puts "SET NAME: #{`git config --global user.name "RichardGogl"`}"
      puts "SET REMOTE: #{`git remote set-url origin https://RichardGogl:powert123@github.com/RichardGogl/1412.git`}"
      puts "SET UPSTREAM MASTER: #{git push --set-upstream origin master}"
      puts "PUSH: #{`git push`}"
      puts "LOG: #{`git log`}"
      puts "STATUS: #{`git status`}"
    end
  end
end
