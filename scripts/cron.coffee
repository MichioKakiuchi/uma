CronJob = require("cron").CronJob

taskA = ->
  msg.send "This is task A"

taskB = ->
  msg.send "This is task B"

taskC = ->
  msg.send "This is task C"

job = new CronJob(
  cronTime: "*/10 * * * * *"
  onTick: ->
    taskA()
    taskB()
    taskC()
    return
  start: false
)

module.exports = (robot) ->

  robot.respond /start job/i, (msg) ->
    msg.send "Start job.."
    job.start()

  robot.respond /stop job/i, (msg) ->
    msg.send "Stop job.."
    job.stop()
