namespace :user do
  task :set_otp_secret => :environment do
    User.all.each do |user|
      if user.otp_secret.empty?
        puts "#{user.email} updated..."
        user.update! otp_secret: ROTP::Base32.random
      end
    end
  end
end
