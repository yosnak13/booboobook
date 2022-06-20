# このアプリについて

## アプリケーション名

**Boo!Boo!Book**
<br>
読書をしながらぶたさんを育てる読書週間を身につけるアプリケーションです。学習時間をなかなか確保できない、もっと学習に楽しみを作りたいという社員の思いからプロジェクトを立ち上げて、開発に至りました。ネーミングの由来は、日本語の豚の鳴き声「Boo」と「Book」を掛け合わせました。あなたは学習を重ねて、無事にぶたさんを育てることができるかな...？

## アプリケーション概要

会員登録をして、書籍を登録して読書するアプリケーション。学習時間がそのままぶたさんの経験値となり、ぶたさんを育成することができます。<br>

初会のログイン(サインアップ終了後の初会ログインで、書籍を１冊登録します）<br>
![初回ログイン](https://user-images.githubusercontent.com/64535376/171208107-de032143-7623-408f-a543-72c4cccedd47.gif)<br>

書籍登録（書籍はログイン後複数登録ができます）<br>
![書籍登録](https://user-images.githubusercontent.com/64535376/171208167-46568d2f-4b95-43bd-ac64-8229b7f4a7c8.gif)<br>

学習時間登録（学習時間を記録すると、1分=1経験値として豚さんを育てレベルアップを狙えます）<br>
![学習時間登録](https://user-images.githubusercontent.com/64535376/171208210-6faac327-3370-40ff-b770-dfeb1de159d8.gif)


## アプリケーション機能
- サインアップ、ログイン機能
- ユーザーによる学習時間の投稿機能
- 読書したい書籍の指定
- 読書した時間に応じて、ぶたさんが経験値を獲得！レベルアップしていきます。
- 特定のレベルに達すると、ぶたさんは進化します！
- 管理者機能：ユーザー管理、投稿管理

## これから実装したい機能候補
- SNS化して他ユーザーと学習内容を共有
- 学習時間のグラフ化
- 経験値取得を助けるアイテム機能の追加
など、もっと使ってみたいと思うような機能を追加したいと考えています。

## プロジェクト概要

共同開発を経験してみたい社内のエンジニアが集まってチーム開発を実施。
10名体制で、エンジニア9名、デザイナー1名です。
このアプリケーションは未経験エンジニアが集まって開発されました。
4ヶ月間で、要件定義、設計、開発、試験まで実施。リリースは知識がなくプロジェクト期間内に実施できませんでしたが、
現在もAWSへデプロイしようと試行錯誤しています。
PJ参加後に初めてHTMLの学習から開始したメンバーも、2ヶ月後にはフロントエンドの開発を行うなど目覚ましい成長を遂げました。

## URL

http://13.114.185.122/


デザインはFigmaで設計：https://www.figma.com/file/G71md7HnY7CXsciVlH8q6w/%E3%82%A2%E3%83%97%E3%83%AA%E4%BD%BF%E7%94%A8%E6%9B%B8?node-id=0%3A1

## インフラ構成図

## 利用方法

ユーザーは会員登録し、書籍を登録。その後は読書時間を登録するだけ！


## 目指した課題解決

- 学習に楽しみを作りたい
- 育成×学習の新しい組み合わせ
- スマホ向けに作成し、場所を問わず利用
- オリジナル書き下ろしのぶたさん画像を使用してかわいさを向上
- 書籍登録にGoogleBooksAPIを使用


## 開発環境

【言語・ツール】
- Ruby:2.6.5
- rails:5.2.6
- db:mysql 5.7
- docker version:20.10.7

【テスト】
- RSpec
- GithubActions

【webサーバー】
- Nginx（予定）

【インフラ（AWSサービス名）】
- EC2、RDS、VPC、S3

【OS】
- macOS
- Windows10
- Amazon Linux2

## 作成者（一部）

yosnak13: https://github.com/yosnak13<br>
Itaru-Nakaya: https://github.com/Itaru-Nakaya<br>
1994reka３: https://github.com/1994reka3<br>
AkaneOtani: https://github.com/AkaneOtani<br>
