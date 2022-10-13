# FFI_Journal
Supplemental information for FFI Journal
≪はじめに≫
本フォルダは、FFIジャーナル Vol.228, No.1, 2023における特集「食品からの有害物質の摂取量
調査の現状と課題」に伴い、公開するものです。

このフォルダはRStudio(※注1)のプロジェクト機能を用いて作製しました。不検出値を含むデータ
に対して対数正規分布を仮定して分布パラメーターをベイズ法を用いて推定し、その結果を用いて
二次元モンテカルロシミュレーションを行う一連の流れを記述したものです。

濃度関連の調査・研究を行っている方で、"不検出"の扱いをどのようにすればよいのか疑問を抱え
ている方への一助となれば幸いです。


≪著作権および免責事項≫
本フォルダ内のコードは自由に使用して下さい。
論文等に使用される際には、以下の論文を引用して頂けますと幸いです。

不検出例を含むデータに対するベイズ推定法の有用性について
・Suzuki, Y., Tanaka, N. and Akiyama, H., Attempt of Bayesian Estimation from Left-censored
 Data Using the Markov Chain Monte Carlo Method: Exploring Cr(VI) Concentrations in Mineral
 Water Products. Food Safety, 8(4), 67-89, DOI: 10.14252/foodsafetyfscj.D-20-00007, (2020).

ベイズ推定を用いた二次元モンテカルロシミュレーションについて
・

なお、このフォルダ内のコードを実行したことによって生じたすべての障害・損害・不具合等に
関しては、私と私の関係者および私の所属するいかなる団体・組織とも、一切の責任を負いません。
各自の責任においてご使用下さい。


≪製作環境≫
このRプロジェクトを作成した環境は以下の通りです。
OS: Windows10
R: 4.1.0
Rstudio: RStudio 2022.07.1+554 "Spotted Wakerobin"
rsatan: ver. 2.21.5


≪ファイル構成≫
2D-MCS.html: 2D-MCS.Rmdファイルの解析をKnit機能を用いてアウトプットしたものです。設定に問
             題が無ければ、このファイルと同じ解析結果が得られるはずです。
2D-MCS.Rmd: Rマークダウンファイル。Rのコードが書いてある。
2D-MCS.Rproj: RStudioのプロジェクトファイル。
2D-MCS.png: 2D-MCSにより得られた乱数のヒストグラムと確率密度分布曲線。
Conc_Lognorm.stan: Stanコードが書いてある。
data.xlsx: Excelで用意したデータの例。Rmdファイル内にはExcelファイルのインポート例を記載し
           ています (コメントアウトしてある)。
2D-MCS--ver-Cmdstanr-.html:2D-MCS  (ver Cmdstanr).Rmdファイルの解析をKnit機能を用いてアウト
             プットしたものです。Cmdstnarに対応したコードになっています。
2D-MCS (ver Cmdstanr).Rmd: Rマークダウンファイル。Cmdstanrに対応したコードが書いてある。


≪インストール方法≫
このフォルダをダウンロードして、任意の場所に保存して下さい。
日本語が使用されているディレクトリへの保存は避けた方が無難です。


≪実行環境の整備について≫
ソフトウェアとしてはRとRStudioを想定しています。
Rのインストール後、自身の環境にあったRStudioをインストールして下さい。
RとRStudioのダウンロード先は以下のとおりです。

R: https://www.r-project.org/
RStudio: https://www.rstudio.com/products/rstudio/download/

このRプロジェクトでは、{rstan}パッケージ(※注2)を使用しています。
下記のサイトに従って{rstan}パッケージのインストールして下さい。

https://mc-stan.org/users/interfaces/rstan
https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started-(Japanese)


※注1 ≪RstudioがPositへと変更≫
このReadmeを作製した時点で、RStudioはPositに変更されることがアナウンスされています。
本Readmeが修正されていない場合は、RStudioをPositと読み替えて下さい。

※注2 ≪{rstan}パッケージの開発状況について≫
{rstan}は2020年7月以降更新されておらず (2022/8/2 現在)、最新のStanの機能が使えません。
また、個人的な印象ですが、{rstan}パッケージは不安定で計算の途中で止まってしまうこともよ
くあります。そこで、{rstan}の使用方法が分かったら、早いうちに{cmdstanr}パッケージに乗り
換えることを薦めます。なお、{rstan}で使用したstanコードは{cmdstanr}でも使用することが可
能です。
{cmdstanr}のインストールおよび実行方法は下記のサイトを参考にして下さい。

https://mc-stan.org/cmdstanr/


≪使用方法≫
RStudioを起動して、フォルダ内の"2D-MCS.Rproj"を開いて下さい。

右下ペインのFileタブより、"2D-MCS.Rmd"をクリックしRmdファイルを開いて下さい。
左上ペインの"2D-MCS.Rmd"タブを選択し、チャンク (コードが書いてある灰色の領域) の右上にあ
る緑三角をクリックすると、チャンク内のコードが順番に実行されます。
順番にチャンク内のコードを実行してください。
"#"記号以降の文字は実行されない、メモ欄になります。

左下ペインのFileタブより、"Conc_Lognorm.stan"をクリックしてStanファイルを開くと、Stan
コードが記載されています。
"//"以降の文字は実行されないメモ欄です。RStudioのKnit機能を使って出力を検討している場合
は、日本語の使用を避けて下さい。


≪アンインストール方法≫
フォルダごと削除ください。
RおよびRStudioのアンインストールは、公式のHPを参照してください


≪履歴≫
2022/9/2: 作製
2022/9/28: Cmdstanrに対応したRmdファイルと解析結果を追加
2022/10/13: GitHubにアップロード 

≪作者≫
鈴木美成
