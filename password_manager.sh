#!/bin/bash

echo "パスワードマネージャーへようこそ！"

while true
do
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
    read word
    if [ "$word" = "Add Password" ]; then
        echo "サービス名を入力してください："
        read  sevice_name
        echo "ユーザー名を入力してください："
        read user_name
        echo "パスワードを入力してください："
        read password
        echo "$sevice_name:$user_name:$password" >> user_info.txt
        echo "パスワードの追加は成功しました"。
    elif [ "$word" = "Get Password" ]; then
        echo "サービス名を入力してください："
        read  sevice_name
        grep $sevice_name user_info.txt > /dev/null
        if [ $? = 0 ]; then
            grep $sevice_name user_info.txt > tmp.txt
            echo "サービス名:`awk -F':' '{print $1}' tmp.txt`"
            echo "ユーザー名:`awk -F':' '{print $2}' tmp.txt`"
            echo "ユーザー名:`awk -F':' '{print $3}' tmp.txt`"
        else
            echo "そのサービスは登録されていません。"
        fi
    elif [ "$word" = "Exit" ]; then
        echo "Thank you!"
        break
    else
        echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    fi
done
