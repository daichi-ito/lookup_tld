require 'net/http'
require 'uri'
require 'rexml/document'

res = Net::HTTP.get_response URI.parse 'https://ja.wikipedia.org/wiki/%E7%89%B9%E5%88%A5:%E3%83%87%E3%83%BC%E3%82%BF%E6%9B%B8%E3%81%8D%E5%87%BA%E3%81%97/%E3%83%88%E3%83%83%E3%83%97%E3%83%AC%E3%83%99%E3%83%AB%E3%83%89%E3%83%A1%E3%82%A4%E3%83%B3%E4%B8%80%E8%A6%A7'
doc = REXML::Document.new(res.body)
src = doc.root.get_elements('page/revision/text').first.text

results = src.scan(/\[\[\.(\w+)\]\]/)
results.each {|x| puts x}

