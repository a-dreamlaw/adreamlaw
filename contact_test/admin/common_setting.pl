#######################################################################
# すぐ使えるメールフォーム 設定ファイル（3つのうち2つ目：動作設定）
# 文字コードは BOM無し UTF-8 で保存して下さい。
# 改行コードは LF または CR+LF （Unix形式またはWindows形式）で保存して下さい。
# Please save this file in UTF-8 without BOM, with LF or CR+LF as line feed code.
#######################################################################
# このファイルで設定する事
#
# - メールの基本設定（必ず設定して下さい）
# - CSVの文字コードの設定
# - タイムアウトの設定
# - 文字化け回避の設定
# - フォームのメッセージとエラーメッセージの指定
# - カスタムチェックの設定
#================================================

#この１行は消さないで下さい。
use utf8;

#================================================
# メールの基本設定
#================================================
# メールのテンプレートのファイル名と管理者メールアドレスを指定して下さい。
# 送信元（$conf{from_mail}）として使用できるメールアドレスは
# サーバによってはドメイン名などが制限されていることがありますので、
# 設置するサーバで使用可能なアドレスを設定して下さい。

$conf{sendmail} = '/usr/sbin/sendmail'; #sendmailのパス
$conf{from_name} = '弁護士法人　淡路町ドリーム'; #メール送信元名称（ユーザ宛て、管理者宛て共通）
$conf{from_mail} = 'info@adreamlaw.com'; #メール送信元（ユーザ宛て、管理者宛て共通）
$conf{mail_encoding} = 'ISO-2022-JP'; #メールの文字コード（以下のいずれか）
	#ISO-2022-JP : JIS。日本語メールの標準
	#ISO-8859-1  : LATIN1。アルファベット系言語の標準
	#UTF-8       : 多言語対応メール

#================================================
# CSVの文字コードの設定
#================================================
$conf{csv_encoding} = 'Shift_JIS'; #CSVファイルの文字コード（以下のいずれか）
	#Shift_JIS :MSエクセルで読む場合の標準
	#UTF-8


#================================================
# タイムアウトの設定
#================================================
$conf{timeout} = 180; #セッションタイムアウトの分数（公開フォーム側）


#================================================
# 文字化け回避の設定
#================================================
#フォーム入力はできてもメールやCSVで表示した時に文字化けする文字は、
#ここで設定して変換する事ができます。
#
#['変換対象', '代替文字'],
$conf{conv_expression} = [
		['⑨','(9)'],
];


#================================================
# フォームのメッセージとエラーメッセージの指定
#================================================
# 画面上に表示されるメッセージをそれぞれの場面に応じて
# 指定して下さい。

# 行頭の「$conf{usermsg}->{'40010'}」等の部分は変更しないで下さい。

#------------------------------------------------
# 入力画面の最初のメッセージ
#------------------------------------------------
$conf{usermsg}->{'30010'} = '項目にご記入の上「確認画面へ」ボタンを押して下さい。';


#------------------------------------------------
# 確認画面の最初のメッセージ
#------------------------------------------------
$conf{usermsg}->{'30015'} = 'この内容でよろしければ確認のメールアドレスをご入力の上「送信」ボタンを押して下さい。';


#---------------------------------
# 入力画面にエラーで戻った時（必須入力エラー）
#---------------------------------
$conf{usermsg}->{'40010'} = '必須入力の項目に未記入がありました。追記して再度送信して下さい。';


#---------------------------------
# 入力画面にエラーで戻った時（形式エラー）
#---------------------------------
$conf{usermsg}->{'40015'} = '入力の形式を確認させていただいたところ、修正をお願いしたい点がございます。';


#---------------------------------
# 項目ごとに表示：入力項目に入力が無かった時（テキストフィールド）
#---------------------------------
# %_field_% には項目名が入ります。

$conf{usermsg}->{'40020'} = '%_field_%は必須項目です。';


#---------------------------------
# 項目ごとに表示：入力項目に入力が無かった時（チェックボックス、ラジオボタン、選択リスト）
#---------------------------------
# %_field_% には項目名が入ります。

$conf{usermsg}->{'40030'} = '%_field_%の選択をご確認ください。必須項目です。';


#---------------------------------
# 項目ごとに表示：形式エラーの時
#---------------------------------
# %_field_% には項目名が入ります。
# %_format_% には「半角数字」等の設定が入ります。

$conf{usermsg}->{'40040'} = '%_field_%は%_format_%でご記入ください。';


#---------------------------------
# 項目ごとに表示：長さエラーの時（オーバー）
#---------------------------------
# %_field_% には項目名が入ります。
# %_format_% には「40」等（設定値）が入ります。
# %_current_% には「50」等（実際値）が入ります。

$conf{usermsg}->{'40050'} = '%_field_%は%_format_%文字以内でご記入ください。（現在%_current_%文字）';


#---------------------------------
# 項目ごとに表示：長さエラーの時（不足）
#---------------------------------
# %_field_% には項目名が入ります。
# %_format_% には「40」等（設定値）が入ります。
# %_current_% には「50」等（実際値）が入ります。

$conf{usermsg}->{'40060'} = '%_field_%は%_format_%文字以上ご記入下さい。（現在%_current_%文字）';


#---------------------------------
# 入力画面を開いた後、送信までに時間が掛かってしまった場合
#---------------------------------
$conf{usermsg}->{'40070'} = '時間が経ったためにタイムアウトしました。このページからもう一度送信して下さい。';


#---------------------------------
# サーバが混雑して一時的に受付ができない場合
#---------------------------------
$conf{usermsg}->{'40080'} = 'ただいまサーバが混雑しています。恐れ入りますが後程もう一度アクセスして下さい。';






#================================================
# カスタムチェックの設定
#================================================
#項目の内容を具体的にチェックしたり、複合的なチェックを
#行う場合はここにチェック関数を指定して下さい。
#編集にあたっては Perl プログラミングの知識が必要です。
#
#カスタマイズサポートについては「すぐ使えるメールフォーム」の
#Webサイトをご参照下さい。
#
#設定方法）
#admin_format で指定した名前で管理画面に表示されます。
#別の値をチェックの時に参照する場合は、$vals{管理名} でチェックできます。
#関数 _is が、チェックを通過させる場合は1、
#エラーにしたい場合は0を返すように設定して下さい。
#
$conf{custom_formats} = {
	if_agree => {
		_is => sub {
			my $str = shift;
			$str eq '同意する' and return 1;
			return 0;
		},
		order => 5, #管理画面での表示順（基本チェックの後）
		admin_format => 'プライバシポリシーへの同意', #管理画面での表示
		local_format => 'プライバシポリシーに「同意する」', #エラーメッセージ
		msg => '%_field_%は%_format_%でご記入ください。',
		#エラーメッセージのフォーマット: %_field_%=項目名、%_format_%=local_format
	},
	if_not_spam => {
		_is => sub {
			my $str = shift;
			#空であれば、問題にしない（必須チェックは管理画面からの項目設定で行う）
			defined $str and length $str or return 1;
			$str =~ /^[\x00-\x7f]+$/ and return 0; #英字しか含まない
			my @temp;
			@temp = ($str =~ m/(@)/g) and (scalar @temp) > 9 and return 0; #@マークが10個以上出現
			@temp = ($str =~ m/(http)/g) and (scalar @temp) > 9 and return 0; #URL表記が10個以上出現
			@temp = ($str =~ m/(<a)/gi) and (scalar @temp) > 9 and return 0; #リンク表記が10個以上出現
			$str =~ m/([\p{IsIdeographic}|\p{IsHiragana}|\p{IsKatakana}]{5,})/ or return 0; #日本語が5文字以上連続
			return 1;
		},
		order => 10, #管理画面での表示順（基本チェックの後）
		admin_format => 'スパムチェック', #管理画面での表示
		local_format => '5文字以上の日本語', #エラーメッセージ
		#msg は無くても可（無ければデフォルトの設定で表示。）
	},
#	#組み合わせ項目のチェック例：電話番号を分けて入力した時など。
#	#例：text_06、text_07、text_08 ３項目を使って電話を入力させた場合
#	#    xxxx-xxxx-xxxx
#	if_tel_fill => {
#		_is => sub {
#			my $str = shift;
#			#空であれば、問題にしない
#			length $str or return 1;
#			length $vals{text_06}
#				and length $vals{text_07}
#				and length $vals{text_08}
#				and $vals{text_06} =~ m/^\d+$/
#				and $vals{text_07} =~ m/^\d+$/
#				and $vals{text_08} =~ m/^\d+$/
#				and return 1;
#			return 0;
#		},
#		order => 20, #管理画面での表示順
#		admin_format => '電話番号の3つの数字', #管理画面での表示
#		local_format => '全ての項目を数字', #エラーメッセージ
#		msg => '電話番号は%_format_%でご記入ください。',
#		#エラーメッセージのフォーマット: %_field_%=項目名、%_format_%=local_format
#	},
#	#組み合わせ項目のチェック例：
#	#２つのチェックボックスのどちらかにチェックが必要な場合など。
#	#チェックボックスの列を分けてCSVに落としたいときに必要。
#	#CSVで同じ列に表示してよい場合は、ここで設定せず管理画面の項目設定で必須にして下さい。
#	if_checkbox_selected => {
#		_is => sub {
#			my $str = shift;
#			defined $str and length $str and return 1; #自分自身の値が選択されていればOK
#			(
#				(exists $vals{checkbox_01} and length $vals{checkbox_01})
#				|| (exists $vals{checkbox_02} and length $vals{checkbox_02})
#			)
#				and return 1;
#			return 0;
#		},
#		order => 30, #管理画面での表示順
#		admin_format => 'チェックボックスの選択', #管理画面での表示
#		local_format => 'どちらかをチェック', #エラーメッセージ（この場合 msg を固定しているので未使用。）
#		msg => 'いずれかのチェックボックスを選択して下さい。',
#		#エラーメッセージのフォーマット: %_field_%=項目名、%_format_%=local_format
#	},
};

#この１行は消さないで下さい。
1;
