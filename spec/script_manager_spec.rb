# frozen_string_literal: true

require 'faker'

RSpec.describe PageBuilder::ScriptManager do

  let(:document) { PageBuilder::Document.new }

  describe '#add_script' do

    let(:url) { Faker::Internet.url }

    it 'stores scripts with no additional attributes' do
      subject.add_script(url)
      subject.append_tags(document.body)
      nodes = document.body.children
      expect(nodes.length).to be 1
      expect(nodes.first).to be_an_html_element(:script, src: url)
    end

    it 'stores the script with any additional tag attributes passed in' do
      classname = Faker::Lorem.word
      random_attr_name = Faker::Lorem.word
      random_value = Faker::Lorem.word
      subject.add_script(url, :class => classname, random_attr_name.to_sym => random_value)

      subject.append_tags(document.body)
      nodes = document.body.children
      expect(nodes.length).to be 1

      node = nodes.first
      expect(node).to be_an_html_element(:script, :class => classname, random_attr_name => random_value, :src => url)
    end

  end

  describe '#append_tags' do

    it 'outputs the scripts in the order they were added' do
      sources = Array.new(rand(2..10)) do
        url = Faker::Internet.url
        subject.add_script(url)
        url
      end

      subject.append_tags(document.body)
      nodeset = document.body.children
      expect(nodeset.length).to eq sources.length
      sources.each_with_index do |url, i|
        expect(nodeset[i]).to be_an_html_element(:script, src: url)
      end
    end

    it 'reorders script output if a script is removed and then added again' do
      sources = Array.new(rand(5..10)) do
        url = Faker::Internet.url
        subject.add_script(url)
        url
      end

      # Make sure the nodes would be there
      div = PageBuilder::Elements::Basic.new('div', document)
      subject.append_tags(div)
      nodes = div.children
      sources.each_with_index do |url, i|
        expect(nodes[i]).to be_an_html_element(:script, src: url)
      end

      # remove a script from the middle and then re-add it to make sure it ends up at the end
      removed_url = sources.delete_at(rand(1...(sources.length)))
      subject.remove_script(removed_url)
      subject.add_script(removed_url)
      sources << removed_url

      div = PageBuilder::Elements::Basic.new('div', document)
      subject.append_tags(div)
      nodes = div.children
      sources.each_with_index do |url, i|
        expect(nodes[i]).to be_an_html_element(:script, src: url)
      end

    end

  end

  describe '#remove_script' do

    it 'blocks a script from being output' do
      url = Faker::Internet.url
      bad_url = Faker::Internet.url

      subject.add_script(url)
      subject.add_script(bad_url)

      div = PageBuilder::Elements::Basic.new('div', document)
      subject.append_tags(div)
      nodes = div.children

      expect(nodes.length).to be 2
      expect(nodes.first).to be_an_html_element(:script, src: url)
      expect(nodes.last).to be_an_html_element(:script, src: bad_url)

      subject.remove_script(bad_url)

      div = PageBuilder::Elements::Basic.new('div', document)
      subject.append_tags(div)
      nodes = div.children
      expect(nodes.length).to be 1
      expect(nodes.first).to be_an_html_element(:script, src: url)
    end

  end

end
