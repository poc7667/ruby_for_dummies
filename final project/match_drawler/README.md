# Description

這是一個可以出遊自動抽籤配對的 App

	ruby match.rb <INTEGER> <NAME.txt>

	INTEGER: 分組數目，假設輸入 5 就代表要將下面的名單均分為五組

	NAME.txt: 存檔的男女姓名
	
* 分類原則
	
1.男女數量盡量平均為佳，曾經同組的盡量不要再同組為佳。
2.不能同一組人，連續兩次同組

* 文字檔格式
		
		批歐西，男	
		Mike，男
		Zina，女
		a，女
		...
		至少十組男女。

# Output

	([批歐西，男	],[Zina，女]), ([Mike，男],[a，女])

# Result

檢驗程式會自動跑一萬次

觀察輸出結果是否均勻。


