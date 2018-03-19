Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
        User.create!(user)
    end
end

Given /the following admins exist/ do |admins_table|
    admins_table.hashes.each do |admin|
        Admin.create!(admin)
    end
end

Given /the following events exist/ do |events_table|
    events_table.hashes.each do |event|
        Event.create!(event)
    end
end

Given /the following dynastys exist/ do |dynastys_table|
    dynastys_table.hashes.each do |dynasty|
        Dynasty.create!(dynasty)
    end
end

Given /the following pointrules exist/ do |pointrules_table|
    pointrules_table.hashes.each do |pointrule|
        PointRule.create!(pointrule)
    end
end


