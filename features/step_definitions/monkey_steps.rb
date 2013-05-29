Then(/^the monkey can't break it$/) do
  system("adb shell monkey -p org.leandog.mastermind.ruboto -v 500")
end
