# Instruction 思路

1. 載入檔案 load the source file.
2. 一行一行讀入迴圈 (from first line to last line)
		
		File.each_line do |this_line|
			if this_line.include? "the keywords you want"
				DO_SOMTHING// write results to somefile
			end
		end
		
3. Exit the program