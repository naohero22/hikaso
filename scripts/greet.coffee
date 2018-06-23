# Description:
#   <description of the scripts functionality>
#
# Dependencies:
#   "<module name>": "<module version>"
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot <trigger> - <what the respond trigger does>
#   <trigger> - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   <github username of the original script author>


module.exports = (robot) ->

  robot.respond /おはよう/i, (msg) ->
    msg.send "おはようございまっするまっする〜〜〜！"
    msg.send ":pill:"
    msg.react "+1"
    msg.react("pill")
    msg.react "pill"
    msg.react ":pill:"
    msg.reply "msg.reply", in_thread=True
    msg.reply "message.reply", in_thread=True


  robot.hear /(遅刻|遅れ|寝坊|遅|おくれ)/i, (msg) ->
    donotlate = msg.random [
      "遅刻ダメ！ゼッタイ！"
      "もう！お寝坊さんなんだから"
      "今月何回目、、かな？"
      "まったくもうまったくもうだよまったくもう"
      "早寝早起きしなさい！"
      "もう！昨日は何時に寝たの!?"
    ]
    msg.reply "#{donotlate}"

  robot.hear /([アイディア]|[IDEA]|[idea]|[あいでぃあ])/i, (msg) ->
    niceIdea = msg.random [
      "まじかよ天才じゃん"
      "その発想はなかったわ！"
      "こんなことを考えれるくらい成長したのですね"
      "グレイトだぜー"
      "アメイジングアイディアやで"
    ]
    msg.reply "#{niceIdea}"


  robot.hear /こんにちは/i, (msg, in_thread) ->
    True = in_thread
    nicehello = msg.random [
      "こんちはん"
      "はんぱいないって"
    ]
    msg.reply "#{nicehello}"











