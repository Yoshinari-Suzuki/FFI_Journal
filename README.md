# FFI_Journal
Supplemental information for FFI Journal
<br>
## ≪はじめに≫
本フォルダは、FFIジャーナル Vol.228, No.1, 2023における特集「食品からの有害物質の摂取量調査の現状と課題」内の私が執筆したレビューが掲載されたことに伴い、誌面の都合上レビュー内で充分に開設できなかった内容を補足するためのものです。<br>
このフォルダはRStudio(※注1)のプロジェクト機能を用いて作製しました。不検出値を含むデータに対して対数正規分布を仮定して分布パラメーターをベイズ法を用いて推定し、その結果を用いて二次元モンテカルロシミュレーションを行う一連の流れを記述したものです。<br>
濃度関連の調査・研究を行っている方で、"不検出"の扱いをどのようにすればよいのか疑問を抱えている方への一助となれば幸いです。

## ≪著作権および免責事項≫
本フォルダ内のコードは自由に使用して下さい。<br>
論文等に使用される際には、以下の論文を引用して頂けますと幸いです。<br>
<br>
**不検出例を含むデータに対するベイズ推定法の有用性について**<br>
* [Suzuki, Y., Tanaka, N. and Akiyama, H., Attempt of Bayesian Estimation from Left-censoredData Using the Markov Chain Monte Carlo Method: Exploring Cr(VI) Concentrations in Mineral  Water Products. Food Safety, 8(4), 67-89, DOI: 10.14252/foodsafetyfscj.D-20-00007, (2020)](https://www.jstage.jst.go.jp/article/foodsafetyfscj/8/4/8_D-20-00007/_article).<br>

**ベイズ推定を用いた二次元モンテカルロシミュレーションについて**<br>
* 鈴木美成, 近藤翠, 北山育子, 穐山浩, 堤智昭, 二次元モンテカルロシミュレーションを用いた食事性鉛曝露量分布の推定:トータルダイエット試料への適用の試み, 食品衛生学雑誌, (accepted).
* 鈴木美成, 二次元モンテカルロシミュレーションを用いた食事性鉛曝露量分布の推定, FFIジャーナル, (accepted).
<br>
なお、このフォルダ内のコードを実行したことによって生じたすべての障害・損害・不具合等に関しては、私と私の関係者および私の所属するいかなる団体・組織とも、一切の責任を負いません。
各自の責任においてご使用下さい。<br>

## ≪製作環境≫
このRプロジェクトを作成した環境は以下の通りです。
* OS: Windows10
* R: 4.1.0
* Rstudio: RStudio 2022.07.1+554 "Spotted Wakerobin"
* rsatan: ver. 2.21.5

## ≪ファイル構成≫
* 2D-MCS.html: 2D-MCS.Rmdファイルの解析をKnit機能を用いてアウトプットしたものです。設定に問題が無ければ、このファイルと同じ解析結果が得られるはずです。
* 2D-MCS.Rmd: Rマークダウンファイル。Rのコードが書いてある。
* 2D-MCS.Rproj: RStudioのプロジェクトファイル。
* 2D-MCS.png: 2D-MCSにより得られた乱数のヒストグラムと確率密度分布曲線。
* Conc_Lognorm.stan: Stanコードが書いてある。
* data.xlsx: Excelで用意したデータの例。Rmdファイル内にはExcelファイルのインポート例を記載しています (コメントアウトしてある)。
* 2D-MCS--ver-Cmdstanr-.html:2D-MCS  (ver Cmdstanr).Rmdファイルの解析をKnit機能を用いてアウトプットしたものです。Cmdstnarに対応したコードになっています。
* 2D-MCS (ver Cmdstanr).Rmd: Rマークダウンファイル。Cmdstanrに対応したコードが書いてある。

## ≪インストール方法≫
緑色のCodeボタンをクリック⇒"Download ZIP"を選択し本プロジェクトのファイルが保存されているzipファイルをダウンロードして下さい。zipファイルを解凍して任意の場所に保存して下さい。<br>
日本語が使用されているディレクトリへの保存は避けた方が無難です。<br>

## ≪実行環境の整備について≫
ソフトウェアとしてはRとRStudioを想定しています。<br>
Rのインストール後、自身の環境にあったRStudioをインストールして下さい。<br>
RとRStudioのダウンロード先は以下のとおりです。<br>
<br>
R: <https://www.r-project.org/><br>
RStudio: <https://www.rstudio.com/products/rstudio/download/><br>
<br>
このRプロジェクトでは、{rstan}パッケージ(※注2)を使用しています。<br>
下記のサイトに従って{rstan}パッケージのインストールして下さい。<br>
<br>
<https://mc-stan.org/users/interfaces/rstan><br>
<https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started-(Japanese)><br>
<br>
{cmdstanr}のインストールおよび実行方法は下記のサイトを参考にして下さい。<br>
<https://mc-stan.org/cmdstanr/>

## ≪使用方法≫
RStudioを起動して、フォルダ内の"2D-MCS.Rproj"を開いて下さい。<br>
右下ペインのFileタブより、"2D-MCS.Rmd"をクリックしRmdファイルを開いて下さい。<br>
左上ペインの"2D-MCS.Rmd"タブを選択し、チャンク (コードが書いてある灰色の領域) の右上にある緑三角をクリックすると、チャンク内のコードが順番に実行されます。<br>
順番にチャンク内のコードを実行してください。<br>
"#"記号以降の文字は実行されない、メモ欄になります。<br>
<br>
左下ペインのFileタブより、"Conc_Lognorm.stan"をクリックしてStanファイルを開くと、Stanコードが記載されています。<br>
"//"以降の文字は実行されないメモ欄です。RStudioのKnit機能を使って出力を検討している場合は、日本語の使用を避けて下さい。<br>

## ≪アンインストール方法≫
フォルダごと削除ください。<br>
RおよびRStudioのアンインストールは、公式のHPを参照してください<br>

## ≪履歴≫
* 2022/9/2: 作製
* 2022/9/28: Cmdstanrに対応したRmdファイルと解析結果を追加
* 2022/10/13: GitHubにアップロード 

## ≪作者≫
鈴木美成<br>
<br>
***
### ※注1: ≪RstudioがPositへと変更≫
このReadmeを作製した時点で、RStudioはPositに変更されることがアナウンスされています。<br>
本Readmeが修正されていない場合は、RStudioをPositと読み替えて下さい。<br>

### ※注2 ≪{rstan}パッケージの開発状況について≫
{rstan}は2020年7月以降更新されておらず (2022/8/2 現在)、最新のStanの機能が使えません。<br>
また、個人的な印象ですが、{rstan}パッケージは不安定で計算の途中で止まってしまうこともよくあります。そこで、{rstan}の使用方法が分かったら、早いうちに{cmdstanr}パッケージに乗り
換えることを薦めます。なお、{rstan}で使用したstanコードは{cmdstanr}でも使用することが可能です。
