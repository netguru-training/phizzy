# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# motivational messages

mm=MotivationalMessage.create(
  content: "You are doing great!"
  ) 
mm2=MotivationalMessage.create(
  content: "Go go go!"
  )
mm3=MotivationalMessage.create(
  content: "Your knee is not your excuse!"
  )
mm4=MotivationalMessage.create(
  content: "Don’t deny the diagnosis; try to defy the verdict."
  )
mm5=MotivationalMessage.create(
  content: "Life is very interesting. In the end, some of your greatest pains become your greatest strengths."
  )
mm6=MotivationalMessage.create(
  content: "We shall draw from the heart of suffering itself the means of inspiration and survival."
  )
mm7=MotivationalMessage.create(
  content: "Pain is inevitable. Suffering is optional."
  )
mm8=MotivationalMessage.create(
  content: "Some patients I see are actually draining into their bodies the diseased thoughts of their minds."
  )
mm9=MotivationalMessage.create(
  content: "The body manifests what the mind harbors."
  )
mm10=MotivationalMessage.create(
  content: "You can promote your healing by your thinking."
  )
mm11=MotivationalMessage.create(
  content: "Yes, you will."
  )

messages=[]
messages<<mm
messages<<mm2
messages<<mm3
messages<<mm4
messages<<mm5
messages<<mm6
messages<<mm7
messages<<mm8
messages<<mm9
messages<<mm10
messages<<mm11


