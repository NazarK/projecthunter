require "rubygems"
require 'json'
require 'net/http'
require 'pp'

=begin
     uri = "http://www.odesk.com/api/profiles/v1/search/jobs.json?page=1;10";    
     html = Net::HTTP.get_response(URI.parse(uri)).body
     File.open('cache.html','w') { |file| file.puts html }

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
=end




class ParserController < ApplicationController
  def exec
     uri = "http://www.odesk.com/api/profiles/v1/search/jobs.json?page=1;200";    
     html = Net::HTTP.get_response(URI.parse(uri)).body
     #File.open('cache.html','w') { |file| file.puts html }
=begin
     f = File.open('cache.html','r')
     html = ""
     f.each_line do |line|
       html += line
     end
=end
     json = JSON.parse(html)
     
     for key, value in json
       p key
     end

     jobs = json['jobs']['job']


     @o = ""
     @newProjects = 0
     
     jobs.each do |el|
       if not Project.find_by_cipher(el['ciphertext'])
         project = Project.new
         project.title = el['op_title']
         project.state = el['op_comm_status']
         project.bids = el['op_tot_cand_prof']
         project.cipher = el['ciphertext']
         project.save
         @newProjects += 1
=begin         
         @o += el['op_title']
         @o += el['op_comm_status']
         @o += el['op_tot_cand_prof']
         @o += "http://odesk.com/jobs/#{el['ciphertext']}"
=end         
       end
       
       
     end
     
  end

end
