### tfidf_calculator.rb
TF・IDFを計算するクラス TFIDFCalculator が書かれている。

### random_select.rb
TFIDFCalculatorクラスの使用例その1。
ランダムに索引語を選択してTFIDF値とともに出力。

### ranking_in_document.rb
TFIDFCalculatorクラスの使用例その2。
001.txtから010.txtぐらいまで、それぞれのファイルのなかでTFIDFが高い索引語を上位5つぐらい出力するプログラムが書かれている。

### ranking_for_term.rb
TFIDFCalculatorクラスの使用例その3。
引数として受け取ったキーワードで全文書を対象にTFIDFを計算。その中からTFIDF値が高いファイルを上位5つほど表示。
レポートのデータ作成に使用。