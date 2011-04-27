require 'rubygems'
require 'net/http'
require 'json'
require 'pp'

=begin
     uri = "http://www.odesk.com/api/profiles/v1/search/jobs.json?page=1;10";    
     html = Net::HTTP.get_response(URI.parse(uri)).body
     File.open('cache.html','w') { |file| file.puts html }
=end

     f = File.open('cache.html','r')
     html = ""
     f.each_line do |line|
       html += line
     end

     json = JSON.parse(html)
     
     for key, value in json
       p key
     end

     jobs = json['jobs']['job']

     for key, value in json['jobs']['job'][0]
       p key
     end

     jobs.each do |el|
       p el['op_title']
       p el['op_comm_status']
       p el['op_tot_cand_prof']
       p "http://odesk.com/jobs/#{el['ciphertext']}"

     end

