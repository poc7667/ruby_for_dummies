require 'roo'
require 'writeexcel'
require 'pry'
require 'pry-remote'
require 'pry-stack_explorer'
require 'awesome_print'
# DEFINE COLUMN POSITION
VNPN_TODO_COL = 4
#
VNPN_DATA_SOURCE = 1

todo_excel = ARGV[0]
data_source_excel =ARGV[1]
#read Excel
todo = Roo::Excel.new(todo_excel)
data_source = Roo::Excel.new(data_source_excel)

# select sheet 1 to read
todo.default_sheet = todo.sheets[0]
data_source.default_sheet = data_source.sheets[0]

# where to store
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
  delta_key = data_source.row(line_no)[VNPN_DATA_SOURCE].to_s
  value = data_source.row(line_no)[-2]
  data_source_hash[delta_key] = value
end
#each todo list
todo_lst.each do | todo |
  sn = todo[VNPN_TODO_COL]
  todo << data_source_hash[sn]
end

p "Elapsed #{Time.now - start_time} sec"
#export excel
wb = WriteExcel.new("#{Date.today.to_s}-export.xls")
ws = wb.add_worksheet

todo_lst.each.with_index(0) do |todo, i|
  todo.each.with_index(0) do |cell, j|
    ws.write(i, j, cell.to_s )
  end
end
# remember to close it
wb.close()
