require 'spec_helper'

describe 'TestThat' do

  context 'it tests that' do

    def visit_site
      puts 'Find transfermarket.com in search restults'
      find('cite', text: 'transfermarket.com', match: :first).find(:xpath, './../../../..').find('a', match: :first).click
      5.times do
        sleep(5+rand*5)
        all('a').sample.click
      end
    end

    it 'works', :type => :feature do
      begin
        Capybara.current_driver = :selenium
        Capybara.app_host = 'http://www.google.com'
        visit '/'
        find('input', match: :first).set 'transfermarket'
        find('.lsb [type="submit"]', match: :first).click
        puts "INPUT VALUE: #{find('input', match: :first).value}"
        sleep(3)
        puts "INPUT VALUE: #{find('input', match: :first).value}"
        find('input', match: :first).set 'transfermarket'
        find('.lsb [type="submit"]', match: :first).click
        puts "INPUT VALUE: #{find('input', match: :first).value}"
        sleep(1)
        puts "INPUT VALUE: #{find('input', match: :first).value}"
        # puts print page.html
        puts "SPELL CORRECTION" if all('.spell_orig', text: 'transfermarket').count > 0
        find('.spell_orig', text: 'transfermarket').click if all('.spell_orig', text: 'transfermarket').count > 0
        10.times do |i|
          puts "Google Page #{i+1}"
          if all('cite', text: 'transfermarket.com').count == 0
            find('#pnnext').click if all('#pnnext').count > 0
          else
            puts "Found on page #{i+1}"
            puts all('.g').map(&:text)
            visit_site
            break
          end
        end
        visit '/'
        find('input', match: :first).set 'transfermarket.com'
        find('.lsb [type="submit"]', match: :first).click
        puts "INPUT VALUE: #{find('input', match: :first).value}"
        sleep(3)
        puts "INPUT VALUE: #{find('input', match: :first).value}"
        find('input', match: :first).set 'transfermarket.com'
        find('.lsb [type="submit"]', match: :first).click
        puts "INPUT VALUE: #{find('input', match: :first).value}"
        sleep(1)
        puts "INPUT VALUE: #{find('input', match: :first).value}"
        # puts print page.html
        puts "SPELL CORRECTION" if all('.spell_orig', text: 'transfermarket').count > 0
        find('.spell_orig', text: 'transfermarket.com').click if all('.spell_orig', text: 'transfermarket.com').count > 0
        visit_site
        puts "GIT: #{`git status`}"
        puts "SET EMAIL: #{`git config --global user.email "RichardGogl123@gmail.com"`}"
        puts "SET NAME: #{`git config --global user.name "RichardGogl"`}"
        puts "SET REMOTE: #{`git remote set-url origin https://RichardGogl:powert123@github.com/RichardGogl/1412.git`}"
        puts "SET UPSTREAM MASTER: #{`git push --set-upstream origin master`}"
        puts "CHECKOUT MASTER: #{`git checkout master`}"
        puts "LOG: #{`git log`}"
        puts "STATUS: #{`git status`}"
        puts "COMMIT: #{`git commit --allow-empty -m "#{rand}"`}"
        puts "PUSH: #{`git push --force`}" if ENV['TRAVIS_BRANCH']
        puts "STATUS: #{`git status`}"
      rescue => e
        puts print page.html
        raise e
      end
    end
  end
end

