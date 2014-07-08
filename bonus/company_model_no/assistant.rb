# encoding: utf-8
require 'roo'
require 'writeexcel'
require 'pry'
require 'pry-nav'
require 'pry-remote'

todo_excel = ARGV[0]
data_source_excel =ARGV[1] 
#read Excel
todo = Roo::Excel.new(todo_excel)
data_source = Roo::Excel.new(data_source_excel)

# select sheet 1 to read
todo.default_sheet = todo.sheets[0]
data_source.default_sheet = data_source.sheets[0]

# wehre to store
todo_lst = []
data_source_lst = []
data_source_hash = {}
start_time = Time.now
# read todo 
(todo.first_row+1).upto(todo.last_row) do |line_no|
  todo_lst << todo.row(line_no)
end
# read data_source excel
(data_source.first_row+7).upto(data_source.last_row) do |line_no|
  key = data_source.row(line_no)[1]
  value = data_source.row(line_no)[-2]
  data_source_hash[key] = value
end

#each todo list
todo_lst.each do | todo |
  sn = todo[1]
  todo << data_source_hash[sn]
end

p "Elapsed #{Time.now - start_time} sec"
#export excel 
wb = WriteExcel.new('export.xls')
ws = wb.add_worksheet

todo_lst.each.with_index(0) do |todo, i|
  todo.each.with_index(0) do |cell, j|
    ws.write(i, j, cell.to_s )
  end
end
# remember to close it
wb.close()
