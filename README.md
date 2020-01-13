# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.6.3

* 環境構築

localhostのSSL証明書が必要です。  
[mkcert](https://github.com/FiloSottile/mkcert)を使用しています。  
【実行コマンド】  
```
$ brew install mkcert`  
$ mkcert -install`  
$ mkcert 0.0.0.0 localhost 127.0.0.1 ::1`
```
上のコマンドを実行してできた証明書をリネームしてconfig配下に配置  
名前は`/config/puma.rb`を参照  

【参考】  
[Railsの開発環境でHTTPSを有効にする](https://blog.y-yagi.tech/posts/rails_ssl/)  
[ローカル環境でSSLをオレオレ証明書で行っていて警告が出てる人に朗報](https://qiita.com/walkers/items/b90a97a99bbb27f6550f)
