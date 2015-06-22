# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


["administrator", "user"].each do |role|
  Role.find_or_create_by(role: role)
end

user = User.create(email: 'administrator@snmmaurya.com', password: "administrator", username: "administrator", role_id: User.roles[:administrator])

user.infos.create({
	fname: "Snm",
	lname: "Maurya",
	contact: "+919910748171",
	gender: "MALE",
	martial_status: "UNMARRIED",
	about_yourself: "Dummy text Dummy text Dummy text Dummy text Dummy text Dummy text Dummy text Dummy text Dummy text Dummy text Dummy text ",
	address: "23 Singhpur Hanswar Ambedkar Nagar UP 224143",
	country_id: 1,
	state_id: 1
})


#------------------------- Country and states ------------------------------#
Country.create({title: "India", iso: nil, code: "+91", currency: "Rupee", capital: "New Delhi", language: "Hindi", sex_ratio: nil, litracy: nil, population: nil})
#-----------------------------------#


State.create({country_id: 1,title: 'Andhra Pradesh',capital: 'Amaravati',population: '4,93,78,776',language: 'Telugu',litracy: '67.66*',sex_ratio: '992*'})

State.create({country_id: 1,title: 'Arunachal Pradesh',capital: 'Itanagar',population: '1,382,611',language: 'English',litracy: '66.95',sex_ratio: '920'})

State.create({country_id: 1,title: 'Assam',capital: 'Dispur',population: '31,169,272',language: 'Assamese',litracy: '73.18',sex_ratio: '954'})

State.create({country_id: 1,title: 'Bihar',capital: 'Patna',population: '103,804,637',language: 'Hindi',litracy: '63.82',sex_ratio: '916'})

State.create({country_id: 1,title: 'Chhattisgarh',capital: 'Raipur',population: '25,540,196',language: 'Chhattisgarhi',litracy: '71.04',sex_ratio: '991'})

State.create({country_id: 1,title: 'Goa',capital: 'Panaji',population: '1,457,723',language: 'Konkani',litracy: '87.4',sex_ratio: '968'})

State.create({country_id: 1,title: 'Gujarat',capital: 'Gandhinagar',population: '60,383,628',language: 'Gujarati',litracy: '79.31',sex_ratio: '918'})

State.create({country_id: 1,title: 'Haryana',capital: 'Chandigarh',population: '25,353,081',language: 'Haryanvi',litracy: '76.64',sex_ratio: '877'})

State.create({country_id: 1,title: 'Himachal Pradesh',capital: 'Shimla',population: '6,856,509',language: 'Hindi',litracy: '83.78',sex_ratio: '974'})

State.create({country_id: 1,title: 'Jammu and Kashmir',capital: 'Srinagar (summer), Jammu (winter)',population: '12,548,926',language: 'Urdu',litracy: '68.74',sex_ratio: '883'})

State.create({country_id: 1,title: 'Jharkhand',capital: 'Ranchi',population: '32,966,238',language: 'Hindi',litracy: '67.63',sex_ratio: '947'})

State.create({country_id: 1,title: 'Karnataka',capital: 'Bengaluru',population: '61,130,704',language: 'Kannada',litracy: '75.6',sex_ratio: '968'})

State.create({country_id: 1,title: 'Kerala',capital: 'Trivandrum',population: '33,387,677',language: 'Malayalam',litracy: '93.91',sex_ratio: '1084'})

State.create({country_id: 1,title: 'Madhya Pradesh',capital: 'Bhopal',population: '72,597,565',language: 'Hindi',litracy: '70.63',sex_ratio: '930'})

State.create({country_id: 1,title: 'Maharashtra',capital: 'Mumbai',population: '112,372,972',language: 'Marathi',litracy: '82.91',sex_ratio: '946'})

State.create({country_id: 1,title: 'Manipur',capital: 'Imphal',population: '2,721,756',language: 'Meiteilon (Manipuri)',litracy: '79.85',sex_ratio: '987'})

State.create({country_id: 1,title: 'Meghalaya',capital: 'Shillong',population: '2,964,007',language: 'English',litracy: '75.48',sex_ratio: '986'})

State.create({country_id: 1,title: 'Mizoram',capital: 'Aizawl',population: '1,091,014',language: 'Mizo',litracy: '91.58',sex_ratio: '975'})

State.create({country_id: 1,title: 'Nagaland',capital: 'Kohima',population: '1,980,602',language: 'English',litracy: '80.11',sex_ratio: '931'})

State.create({country_id: 1,title: 'Odisha',capital: 'Bhubaneswar',population: '41,947,358',language: 'Oriya',litracy: '73.45',sex_ratio: '978'})

State.create({country_id: 1,title: 'Punjab',capital: 'Chandigarh',population: '27,704,236',language: 'Punjabi',litracy: '76.68',sex_ratio: '893'})

State.create({country_id: 1,title: 'Rajasthan',capital: 'Jaipur',population: '68,621,012',language: 'Hindi',litracy: '67.06',sex_ratio: '926'})

State.create({country_id: 1,title: 'Sikkim',capital: 'Gangtok',population: '607,688',language: 'Nepali',litracy: '82.2',sex_ratio: '889'})

State.create({country_id: 1,title: 'Tamil Nadu',capital: 'Chennai',population: '72,138,958',language: 'Tamil',litracy: '80.33',sex_ratio: '995'})


State.create({country_id: 1,title: 'Telangana',capital: 'Hyderabad',population: '3,52,86,
 757',language: 'Telugu, Urdu',litracy: '66.46%',sex_ratio: '988'})


State.create({country_id: 1,title: 'Tripura',capital: 'Agartala',population: '3,671,032',language: 'Bengali and Kokborok',litracy: '87.75',sex_ratio: '961'})

State.create({country_id: 1,title: 'Uttar Pradesh',capital: 'Lucknow',population: '199,581,477',language: 'Hindi',litracy: '69.72',sex_ratio: '908'})

State.create({country_id: 1,title: 'Uttarakhand',capital: 'Dehradun',population: '10,116,752',language: 'Hindi',litracy: '79.63',sex_ratio: '963'})

State.create({country_id: 1,title: 'West Bengal',capital: 'Kolkata',population: '91,347,736',language: 'Bengali',litracy: '77.08',sex_ratio: '947'})


State.create({country_id: 1,title: 'Andaman and NicobarIslands',capital: 'Port Blair',population: '379,944',language: 'English',litracy: '86.27',sex_ratio: '878'})

State.create({country_id: 1,title: 'Chandigarh',capital: 'Chandigarh',population: '1,054,686',language: 'Punjabi',litracy: '86.43',sex_ratio: '818'})

State.create({country_id: 1,title: 'Dadar and Nagar Haveli',capital: 'Silvassa',population: '342,853',language: 'English',litracy: '77.65',sex_ratio: '775'})

State.create({country_id: 1,title: 'Daman and Diu',capital: 'Daman',population: '242,911',language: 'Konkani, Marathi and Gujarati',litracy: '87.07',sex_ratio: '618'})

State.create({country_id: 1,title: 'Delhi',capital: 'Delhi',population: '16,753,235',language: 'Hindi, Punjabi and Urdu',litracy: '86.34',sex_ratio: '866'})

State.create({country_id: 1,title: 'Lakshadweep',capital: 'Kavaratti',population: '64,429',language: 'English',litracy: '92.28',sex_ratio: '946'})

State.create({country_id: 1,title: 'Pondicherry',capital: 'Pondicherry',population: '1,244,464',language: 'Tamil, English',litracy: '86.55',sex_ratio: '1038'})



# ["Ruby", "Ruby On Rails", "Jquery", "MySQL", "Angular JS"].each do |book|
# 	Book.find_or_create_by(title: book, image: "#{book.gsub(" ", "_").downcase}.jpg", description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nun.")
# end


# ["Ruby", "Ruby On Rails", "PHP", "Jquery", "MySQL", "Angular JS"].each do |solution|
# 	Solution.find_or_create_by(solution: solution, image: "#{solution.gsub(" ", "_").downcase}.jpg", description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nun.")
# end



# Development.create({title: "PHP [Core PHP] [Wordpress]", type: "WEB", user_id: 1})
# Development.create({title: "Ruby [Ruby On Rails] [Comfy]", type: "WEB", user_id: 1})
# Development.create({title: "Javascript [AngularJS] [Jquery]", type: "WEB", user_id: 1})
# Development.create({title: "Android [Application Development]", type: "MOBILE", user_id: 1})
# Development.create({title: "Python [Monkeyrunner Script]", type: "MOBILE", user_id: 1})
