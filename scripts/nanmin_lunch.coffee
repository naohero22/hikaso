request = require('request')

module.exports = (robot) ->
  robot.hear /ランチ難民(.*)?/, (msg) ->
    groups = []
    numberOfGroup = 4
    request.get
      url: "https://slack.com/api/users.list?token=#{process.env.HUBOT_SLACK_TOKEN}"
      , (err, response, body) ->
        # Slack APIからメンバーを取得
        # msg.send "#{JSON.parse(body).members}"
        # members = (member.first_name for member in JSON.parse(body).members when member.deleted isnt false)
        members = (member.name for member in JSON.parse(body).members when member.deleted is false and member.is_bot is false and member.is_ultra_restricted is false)
        # membersreal = (member.real_name for member in JSON.parse(body).members when member.deleted is false and member.is_bot is false and member.is_ultra_restricted is false　and member.is_restricted is false)
        msg.send "#{members}"
        # msg.send "#{membersreal}"


        
        # シャッフル
        i = members.length
        while --i > 0
          j = ~~(Math.random() * (i + 1))
          member = members[j]
          members[j] = members[i]
          members[i] = member
        
        # グループ分け
        while members.length > 0
          group = members.splice(0, numberOfGroup)
          if group.length is numberOfGroup
            groups.push group
          else
            for member, index in group
              groups[index].push member
        
        # 応答
        msg.send "今日のランチグループはこちら"
        for group, index in groups
          msg.send "#{index+1}班: #{group.join('さん、')}"

        


        # Slack APIからチャンネル名を取得
        ###
        channel = msg.message.room
        msg.send "#{channel.name}"
        msg.send "#{msg.message.room.name}"
        msg.send "#{msg.message.room.creator}"
        ###


