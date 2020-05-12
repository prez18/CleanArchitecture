# Clean Architecture



# 概要

Clean ArchitectureのiOS実装のFileTemplateを実装した． 

SwiftUIではなく，UIViewControllerに対応したものである．

実装例は，サンプルプロジェクトを確認のこと． 



このプロジェクトでのClean ArchitectureはiOS実装であるClean Swiftと，  

「The Principles of Clean Architecture by Uncle Bob Martin」(下図)に基づいて構成したものである．  



![Uncle Bob のアーキテクチャ説明](https://herbertograca.files.wordpress.com/2017/04/cleanarchitecturedesign.png?w=1100)



# 各レイヤーの説明



## Controller

コントローラであり，UIViewContrtrollerのこと．  

ボタンタップなどイベントを解釈してInteractor(アプリケーションロジック)を呼び出す．

このさい，引数にはプレーンオブジェクトを渡し，Entitiesに変換して渡す必要はない．

`PresenterOutput`からUIを更新する．



コツ

- 薄く保つ



## Interactor  

Interactorとはアプリケーションビジネスロジックのことである． 

原文では`execute`メソッドのみ持つとあるが，iOSアプリとしては画面ごとに定義する．

これは，実際問題として単純なアプリケーションでは，ユーザのアクションごとに定義するのは，手間がかかること，または，複数のInteractor間でEntitiesを共用する場合が多々あり，データの扱いやすさを考慮した結果である．  

メソッド名は，ユーザやシステムの意図を反映させたメソッド名とする．  



アプリケーションビジネスロジックを記述するさい，何も考えず手続き的に処理を記述すると，  

Interactorはあっという間に肥大化する．  

または，複数のInteractorで同じ処理を何度も書くなど，処理が散らばってしまう．  

そこで，汎用的な処理や制約，処理はEntitiesとして抽出する．

アプリケーションビジネスロジックはEntities操作するだけで薄く保たれるようにする．  

簡単にいうとInteractorが文章でEntitiesは単語や動詞のイメージ．



何かしら外部やDB，SDKとやりとりする場合はGatewayインタフェースを介して，実施する．

このとき，Gatewayの引数や戻り値はEntitiesとなる．  



アプリケーションビジネスロジックの処理内容を外部に伝える場合は，  

InteractorOutputから伝達する．  

メソッドの引数には，Interacttorで定義したプレーンオブジェクトやEntitiesを渡すことができる．



テスタブルとなるように実装する．



コツ

- とにかく薄く保つ
- privateメソッドは極力利用しない(Entitiesで表現できないか検討する)



## Entities  

あらゆるInteractorから利用される．

原文ではあらゆるアプリで共通のビジネスロジックとしているが，実装するアプリに対して，汎用的な処理のこと，として捉える．



プロパティだけでなく，メソッドを持つこともできる．  

メソッドのみを持つ場合もある．  



DBやJSONといったインフラ層のデータ構造に依存せず，ビジネスロジックとして最適な表現となるようにする．  

たとえば，APIのレスポンスが「0」「1」だからIntやStringで表現するとかしないで，  

EnitiesではBoolで表現する．



コツ

- 必要がなければletを使う
- 必要がなければ非オプショナルを使う

- セッターは基本使わない
- 取り違えやすい値は，独自オブジェクトを定義する
- 比較演算子をオーバライドする
- 列挙型使う
- バリデーションや条件を表現する
- コレクションを保持するEntitiesを定義する



テスタブルとなるように実装する．



## Presenter

Interactorからの出力をViewModel(データ構造)に変換してViewに命令を出す．

画面ごとに定義する．



コツ

- 薄く保つ

  

## Gateway

何かしら外部やDB，SDKとやりとりする場合に定義する．  

永続化機構の責務だけでなく，外部サービスの実行などを責務に持つ．

Repositoryという表現は永続化機構のみをさす場合があるため用いない．



複数のInteractorから利用される．  

引数と戻り値には，Entitiesを渡す．

Gateway実装内で，EntitiesをAPIやDBに最適な形に変更したり，またその逆を行う．  



コツ

- IFに`useCash`など引数に持たせて，キャッシュの利用は制御できるようにする
- APIやDBという表現は，IFとして現れないようにする
  - APIからのデータをデータベースにキャッシュする処理などは実装内に隠蔽する
- API固有のアクセストークンや端末種別，OS種別は実装内に隠蔽し，IFに出ないようにする
- 実装で，整合性を保てるように処理する(登録解除したら，関連するローカルの永続化データは全て削除する)
- 要は，Interactorによって都合が良いIFとなれば良い



## API DataBase



APIやDatabaseを表現する．  

GatewayとN:Nになる． 

アクセストークンAPIなどあらゆるGatewayで利用される．  

また1つのGatewayから複数のAPI DataBaseが呼ばれることがある．   

引数と戻り値には，Entitiesを渡す．



- コツ
  - APIを実行して裏でDatabaseにキャッシュとかはここではしない
  - APIとDBはframesworkを切ると特に良い



# 参考になる資料

- [(書籍)Clean Architecture 達人に学ぶソフトウェアの構造と設計](https://www.amazon.co.jp/Clean-Architecture-達人に学ぶソフトウェアの構造と設計-Robert-C-Martin/dp/4048930656/ref=sr_1_1?__mk_ja_JP=カタカナ&crid=3G6NS0VBWU4BX&keywords=clean+architecture&qid=1584239376&sprefix=clean+arthi%2Caps%2C240&sr=8-1)
    - Clean Architecctureの提唱者の書籍
- [(Youtube動画)The Principles of Clean Architecture by Uncle Bob Martin](https://www.youtube.com/watch?v=o_TH-Y78tt4)
    - Clean Architecctureの提唱者の動画
    - 動画中にどんなレイヤーが出てくるかを注意してみると良い
        - RepositoryやUseCaseなど出てこない
        - GatewayやInteractor，Presenterが出てくる
- [(ブログ)誤解のないクリーンアーキテクチャ](https://habr.com/ru/company/mobileup/blog/335382/)
    - クリーンアーキテクチャの誤解されがちな部分を的確に解説している．
    - Android界隈で混乱が発生している経緯も解説されている
- [(Webサイト)Clean Swift](https://clean-swift.com/clean-swift-ios-architecture/)
    - Clean ArchitecctureのiOS実装

