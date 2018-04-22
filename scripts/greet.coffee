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
    msg.send "おはようございまっするまっする！"

  robot.hear /(遅刻|遅れ|寝坊|遅)/i, (msg) ->
    donotlate = msg.random [
      "遅刻ダメ！ゼッタイ！"
      "もう！お寝坊さんなんだから"
      "今月何回目、、かな？"
      "まったくもう、まったくもうだよまったくもう"
      "早寝早起きしなさい！"
      "もう！昨日は何時に寝たの!?"
    ]
    msg.reply "#{donotlate}"

